import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(UserList());
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true), home: Chat());
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    /* Creamos un Stream que va a contener el flujo de datos de 'messages',
    * CollectionReference -> Es el apuntador a la colección a la que intentamos acceder (messages),
    * snapshots() las diferentes campturas de estado que va viajando pro el flujo */
    final CollectionReference messagesStream = FirebaseFirestore.instance
        .collection("messages");
    // Creamos un mapa donde almacenar los datos que vienen del flujo
    Map<String, dynamic> datos = {};
    return Scaffold(
      // La columna principal
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesStream.snapshots(),
              builder: (context, snapshot) {
                // En caso de que haya error mostramos un texto rojo
                if (snapshot.hasError) {
                  return Text(
                    "Ha ocurrido un error",
                    style: TextStyle(color: Colors.red.shade400, fontSize: 20),
                  );
                  // Mientras se esperan a los datos del flujo
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                  // Si están los datos
                  // Comprobamos que siga activa la conexión y por lo tanto el flujo de datos
                } else {
                  int numElementos = snapshot.data!.docs.length;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      // Casteamos a DocumentSnapshot para poder acceder a la información de un snapshot concreto
                      DocumentSnapshot document =
                          snapshot.data!.docs.elementAt(index)
                              as DocumentSnapshot;
                      // Casteamos el document a un mapa para acceder a la key y value
                      datos = document.data()! as Map<String, dynamic>;
                      return Card(
                        color: Colors.green.shade400,
                        child: ListTile(
                          trailing: Icon(Icons.message),
                          title: Text(datos['sender'] ?? "Sin remitente"),
                          subtitle: Text(datos['text'] ?? "Sin mensaje"),
                          leading: Text(
                            datos['date']?.toString() ?? "Sin fecha",
                          ),
                        ),
                      );
                    },
                    itemCount: numElementos,
                  );
                }
              },
            ),
          ),
          // Row donde aparece el TextFormField y el botón de enviar el mensaje
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 4, child: TextFormField()),
                Expanded(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
