import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart'; // Importamos firebase_options de la base de datos del profesor

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

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  /* Creamos un CollectionReference que va a contener la referencia a los datos de 'messages',
    * CollectionReference -> Es el apuntador a la colección a la que intentamos acceder (messages),
    * snapshots() -> las diferentes campturas de estado que va viajando por el flujo */
  final CollectionReference messagesStream = FirebaseFirestore.instance
      .collection("messages");

  // Creamos la clave del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos un mapa donde almacenar los datos que vienen del flujo
  Map<String, dynamic> datos = {};

  // Creamos el controlador del mensaje a enviar
  final TextEditingController _mensajeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mensajeController.addListener(() => print(_mensajeController.text));
  }

  @override
  void dispose() {
    _mensajeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      // La columna principal
      body: Column(
        children: [
          Expanded(
            flex: 7,
            // StreamBuilder -> Bloque que hace setState() solo cuando recibe datos del Stream
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
                  /* Esta variable se va a ir actualizando con la cantidad de datos que pasen por el flujo,
                   nos sirve para darle el tamaño a la LisView.builder() */
                  //int numElementos = snapshot.data!.docs.length; -> No es necesaria
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      /* Casteamos a DocumentSnapshot para poder acceder a la información (data)
                       de un snapshot concreto, con docs se devuelve una lista de todos los
                       documentos */
                      DocumentSnapshot document =
                          snapshot.data!.docs.elementAt(index)
                              as DocumentSnapshot;
                      // Casteamos el document a un mapa para acceder a la key y value
                      datos = document.data()! as Map<String, dynamic>;
                      // Envolvemos la card en un Dismissible para borrar un mensaje
                      return Dismissible(
                        background: Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        direction: DismissDirection.endToStart,
                        key: Key(document.id),
                        onDismissed: (direction) async {
                          /* Eliminamos el document con delete(), pero necesitamos la referencia,
                          * que esta la obtenemos con reference */
                          await document.reference.delete();
                        },
                        child: Card(
                          color: Colors.green.shade400,
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.change_circle_outlined),
                              // Este botón va a eliminar el value de un key del document
                              onPressed: () async {
                                await eliminarCampoValue(
                                  "text",
                                  messagesStream,
                                  document.reference,
                                );
                              },
                            ),
                            title: Text(datos['sender'] ?? "Sin remitente"),
                            subtitle: Text(datos['text'] ?? "Sin mensaje"),
                            leading: Text(
                              datos['date']?.toString() ?? "Sin fecha",
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                }
              },
            ),
          ),
          // Row donde aparece el TextFormField y el botón de enviar el mensaje
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Card(
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El mensaje no puede estar vacío";
                            }
                            return null;
                          },
                          controller: _mensajeController,
                          decoration: InputDecoration(
                            label: Text("Escribe el mensaje"),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  // El botón para enviar el mensaje
                  child: IconButton(
                    onPressed: () async {
                      // Comprobamos que el mensaje no esté vacío
                      if (_formKey.currentState!.validate()) {
                        await enviarMensaje(
                          _mensajeController.text,
                          messagesStream,
                        );
                        // Limpiamos una vez que enviamos el mensaje
                        _mensajeController.clear();
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Esta función va a añadir a a la colección de 'messages' de la base de datos
/// el documento con un id auto-generado con los campos 'sender', 'text' y 'date'
Future<void> enviarMensaje(String mensaje, CollectionReference messages) async {
  await messages
      .add({
        "sender": "Alberto",
        "text": mensaje,
        "date":
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      })
      .then((value) => print("-------Mensaje enviado-------"));
}

/// Esta función va a eliminar el campo de un mensaje
Future<void> eliminarCampoValue(
  String nombreCampo,
  CollectionReference messages,
  DocumentReference documentReference,
) async {
  await messages
      // Mediante la referencia a la colección obtenemos el documento por su id
      .doc(documentReference.id)
      // Actualizamos el campo que pasemos por parámetros
      .update({nombreCampo: FieldValue.delete()})
      .then((value) => print("----Campo eliminado----"));
}
