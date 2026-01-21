import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainEncuestas());
}

class MainEncuestas extends StatelessWidget {
  const MainEncuestas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: "MainEncuestas",
      home: Votacion(),
    );
  }
}

class Votacion extends StatefulWidget {
  const Votacion({super.key});

  @override
  State<Votacion> createState() => _VotacionState();
}

class _VotacionState extends State<Votacion> {
  // Creamos la referencia a la colección de lenguajes
  final CollectionReference lenguajeReference = FirebaseFirestore.instance
      .collection("encuestas");

  // Creamos una lista de los diferentes campos que hay para así recorrerlos
  List<String> lenguajesList = ["dart", "python", "java"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guerra de lenguajes 🔥"),
        backgroundColor: Colors.blueAccent,
      ),
      /* IMPORTANTE: el StreamBuilder, tiene su estado propio que se actualiza solo, no solo eso,
       también el snapshot que devuelve ya es cargado, no una promesa a futuro */
      body: StreamBuilder(
        stream: lenguajeReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              "Error",
              style: TextStyle(fontSize: 22, color: Colors.red),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            int totalVotos = calcularTotal(snapshot.data!.docs);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Votos Totales: $totalVotos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (int i = 0; i < lenguajesList.length; i++)
                    _BarraVotacion(
                      label: lenguajesList.elementAt(i).toUpperCase(),
                      votos: obtenerVotosLenguaje(
                        lenguajesList.elementAt(i),
                        snapshot,
                      ),
                      total: totalVotos,
                      color: i == 0
                          ? Colors.lightBlueAccent
                          : i == 1
                          ? Colors.orange
                          : Colors.red,
                      onTap: () async {
                        await incrementarVotacion(
                          lenguajesList.elementAt(i),
                          snapshot,
                        );
                      },
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

/// Esta función va a devolver un int que se ha obtenido sumando todos los valores
/// de cada snapsho, sumando los votos para cada lenguaje, AsyncSnapshot<QuerySnapshot<Object?>>
/// es el informe de un snapchot, nos puede avisar de errores y demás,
/// este ya estará cargado gracias al StreamBuilder en la práctica es un snapshot,
/// vamos a pasar la lista de documentos del snapshot
int calcularTotal(List<QueryDocumentSnapshot<Object?>> snapshot) {
  /* Con fold() reducimos el flujo en un solo valor por como
  * el reduce() de Java, 'previousValue' representa el valor acumulado
  * que lo empezamos en 0 */
  return snapshot.fold(0, (previousValue, element) {
    // Casteamos a doc el elemento
    DocumentSnapshot doc = element as DocumentSnapshot;
    // Una vez que tenemos el Document lo casteamos a un mapa para acceder a los valores
    Map<String, dynamic> mapa = doc.data() as Map<String, dynamic>;
    // Suma acumulada
    int suma = 0;
    // Se suma dependiendo del valor obtenido
    suma += (mapa["dart"] ?? 0) as int;
    suma += (mapa["python"] ?? 0) as int;
    suma += (mapa["java"] ?? 0) as int;
    // Le sumamos al acumulador el valor correspondiente
    return previousValue += suma;
  });
}

/// Esta función va a incrementar en 1 el número de la votación del lenguaje
/// pasado por parámetros, que eso dependerá realmente de una lista que va a contener
/// el nombre de cada campo y dependiendo del cual esté en ese momneto en la iteración
/// se incrementa
Future<void> incrementarVotacion(
  // TODO: debe haber 2 documentos, preguntar al maestro, ya al votar se suma 2, es decir que al sumar, suma el doble
  String campo,
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
) async {
  // Recorremos los documentos de la última foto
  List<DocumentSnapshot<Object?>> lista = snapshot.data!.docs
      // Los casteamos a DocumentSnapshot para poder actualizar
      .map((e) => e as DocumentSnapshot)
      .toList();
  /* Con FieldValue.increment() incrementamos en 1 el valor, no se puede utilizar
       el forEach(), este no espera al wait(), el for-in/for es válido */
  print(lista.length); // Mostramos los documentos que hay
  for (DocumentSnapshot doc in lista) {
    await doc.reference.update({campo: FieldValue.increment(1)});
  }
}

int obtenerVotosLenguaje(
  String lenguaje,
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
) {
  return snapshot.data!.docs.fold(0, (previousValue, element) {
    // Casteamos a DocumentSnapshot
    DocumentSnapshot doc = element as DocumentSnapshot;
    // Casteamos al mapa para poder buscar el campo (lenaguaje) y sumar
    Map<String, dynamic> mapa = doc.data()! as Map<String, dynamic>;
    // Sumamos al acumulador
    return previousValue += (mapa[lenguaje] ?? 0) as int;
  });
}

class _BarraVotacion extends StatelessWidget {
  final String label;
  final int votos;
  final int total;
  final Color color;
  final VoidCallback onTap;

  const _BarraVotacion({
    required this.label,
    required this.votos,
    required this.total,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Evitamos división por cero si es el primer voto
    double porcentaje = total == 0 ? 0 : votos / total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap, // Al tocar, vota
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "$votos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // La barra animada
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: porcentaje,
                  minHeight: 25,
                  backgroundColor: Colors.grey[200],
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
