import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainFirestore());
}

class MainFirestore extends StatelessWidget {
  const MainFirestore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Acceso a base de datos",
      theme: ThemeData(useMaterial3: true),
      home: FirestorePrueba(),
    );
  }
}

class FirestorePrueba extends StatefulWidget {
  const FirestorePrueba({super.key});

  @override
  State<FirestorePrueba> createState() => _FirestorePruebaState();
}

class _FirestorePruebaState extends State<FirestorePrueba> {
  // Creamos una lista local de los documentos
  List<QueryDocumentSnapshot> list = [];

  // Creamos una lista de ListTile
  List<ListTile> listTile = [];

  @override
  Widget build(BuildContext context) {
    // Creamos un escuchador de cambios, este solo se puede crear dentro del build
    FirebaseFirestore.instance.collection('messages').snapshots().listen((
      event,
    ) {
      event.docs.forEach((element) {
        print("********************************");
        print(element.data());
        // TODO: por mirar esto y la agregación y modificación de datos
        listTile.add(ListTile(title: element.get("sender"),));
      });
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () async {
                list = await obtenerColeccion();
                setState(() {});
              },
              child: Text("Obtener datos"),
            ),
            for (int i = 0; i < list.length; i++)
              TextData(map: list.elementAt(i).data() as Map<String, dynamic>),
          ],
        ),
      ),
    );
  }
}

/// Esta función va a devolver una lista de documentos
/// de la colección de 'messages'
Future<List<QueryDocumentSnapshot>> obtenerColeccion() async {
  // Devuelve una Query con los datos de la colección 'messages'
  QuerySnapshot query = await FirebaseFirestore.instance
      .collection('messages')
      .get();
  // Obtenemos una lista de los documentos
  return query.docs;
}

/// Esta función va a devolver columnas
/// con la información de data
class TextData extends StatelessWidget {
  final Map<String, dynamic> map;

  const TextData({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(map["sender"], style: TextStyle(fontSize: 24)),
        Text(map["text"]),
      ],
    );
  }
}
