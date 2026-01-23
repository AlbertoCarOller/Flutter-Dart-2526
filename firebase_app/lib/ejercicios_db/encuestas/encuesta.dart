import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Encuesta extends StatefulWidget {
  const Encuesta({super.key});

  @override
  State<Encuesta> createState() => _EncuestaState();
}

class _EncuestaState extends State<Encuesta> {
  // Creamos un ScrollController
  final scrollController = ScrollController();

  // Creamos la variable donde se va a almacenar el documento id
  String docId = "";

  // Creamos un controller para un textFormField para agregar campo
  final _campoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => print(scrollController.position.pixels));
    _campoController.addListener(() => print(_campoController.text));
  }

  @override
  void dispose() {
    scrollController.dispose();
    _campoController.dispose();
    super.dispose();
  }

  // didChangeDependencies() -> Un bloque que contiene el contexto para cargar argumentos
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtenemos el id del documento, comprobamos que no sea null
    docId = (ModalRoute.of(context)?.settings.arguments == null
        ? "Error"
        : ModalRoute.of(context)!.settings.arguments as String);
    // Si el docId al recargar es "", volvemos a la pantalla raíz (menú)
    if (docId == "Error") {
      /* Utilizamos WidgetsBinding.instance.addPostFrameCallback((_)
       => Navigator.of(context).pushReplacementNamed("/") para navegar a la raíz */
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.of(context).pushReplacementNamed("/"),
      );
    }
  }

  // Creamos la referencia a la colección de encuestas, accediendo a un documento concreto
  DocumentReference<Object?> get lenguajeReference =>
      FirebaseFirestore.instance.collection("encuestas").doc(docId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encuesta de $docId 🔥"),
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
            // Variable para el número total de votos
            int totalVotos = calcularTotal(snapshot);
            // Guardamos el mapa de los diferentes campos del documento
            Map<String, dynamic> campos =
                snapshot.data!.data() as Map<String, dynamic>;
            // Lo transformamos a una lista para ordenar los campos (alfabéticamente)
            List<MapEntry<String, dynamic>> lista = campos.entries.toList();
            // Con sort() ordenamos, IMPORTANTE LOS MAPAS NO PUEDEN ORDENAR
            lista.sort((a, b) => b.key.compareTo(a.key));
            // Hacemos la pantalla scrollable
            return Center(
              child: SingleChildScrollView(
                controller: scrollController,
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
                    for (int i = 0; i < lista.length; i++)
                      _BarraVotacion(
                        label: lista.elementAt(i).key.toUpperCase(),
                        votos: obtenerVotosCampo(lista.elementAt(i)),
                        total: totalVotos,
                        color: i == 0
                            ? Colors.lightBlueAccent
                            : i == 1
                            ? Colors.orange
                            : Colors.red,
                        onTap: () async {
                          await incrementarVotacion(
                            // Le pasamos el key
                            lista.elementAt(i).key,
                            snapshot,
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Creamos un TextFormField para crear un campo nuevo de encuesta
                            SizedBox(
                              width: 250,
                              height: 70,
                              child: TextFormField(
                                controller: _campoController,
                                decoration: InputDecoration(
                                  label: Text("Introduce un campo"),
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                            IconButton(
                              // Al presionar el botón se crear el atributo para el document
                              onPressed: () {
                                crearCampo(
                                  lenguajeReference,
                                  _campoController.text,
                                );
                              },
                              icon: Icon(Icons.arrow_upward_outlined),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

/// Esta función va a devolver un int que se ha obtenido sumando todos los valores
/// de cada snapsho, sumando los votos para cada lenguaje, AsyncSnapshot
/// es el informe de un snapchot, nos puede avisar de errores y demás,
/// este ya estará cargado gracias al StreamBuilder en la práctica es un snapshot,
/// vamos a pasar la lista de documentos del snapshot
int calcularTotal(AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
  /* Con fold() reducimos el flujo en un solo valor por como
  * el reduce() de Java, 'previousValue' representa el valor acumulado
  * que lo empezamos en 0 (Deprecado) */
  // Obtenemos el DocumentSnapshot, casteamos
  DocumentSnapshot doc = snapshot.data as DocumentSnapshot;
  // Ahora obtenemso los datos del DocumentSnapshot y lo casteamos al mapa
  Map<String, dynamic> mapa = doc.data() as Map<String, dynamic>;
  // Obtenemos el total de votos con las entradas de un mapa
  return mapa.entries.fold(0, (previousValue, element) {
    if (element.value is int) {
      previousValue += element.value as int;
    }
    return previousValue;
  });
}

/// Esta función va a incrementar en 1 el número de la votación del lenguaje
/// pasado por parámetros, que eso dependerá realmente de una lista que va a contener
/// el nombre de cada campo y dependiendo del cual esté en ese momneto en la iteración
/// se incrementa
Future<void> incrementarVotacion(
  String campo,
  AsyncSnapshot<DocumentSnapshot<Object?>> snapshot,
) async {
  // Obtenemos el document
  DocumentSnapshot doc = snapshot.data as DocumentSnapshot;
  /* Con FieldValue.increment() incrementamos en 1 el valor, no se puede utilizar
       el forEach(), este no espera al wait(), el for-in/for es válido (Deprecado) */

  /* Incrementamos la votación del lenguaje concreto, debemos de obtener la referencia
   del document para poder llamar a update() */
  doc.reference.update({campo: FieldValue.increment(1)});
}

/// Esta función va a obtener las votaciones de un campo
/// concreto
int obtenerVotosCampo(MapEntry<String, dynamic> entry) {
  // El valor del campo concreto
  return entry.value is int ? entry.value : 0;
}

/// Esta función va a añadir un campo a un documento ya existente, para
/// mantener lo que ya hay debemos de usar un SetOptions(merge: true),
/// para no sobreescribir
Future<void> crearCampo(
  DocumentReference documentReference,
  String nombreCampo,
) async {
  documentReference.set({nombreCampo: 0}, SetOptions(merge: true));
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
