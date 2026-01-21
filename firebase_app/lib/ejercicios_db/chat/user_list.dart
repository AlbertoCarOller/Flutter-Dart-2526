import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../firebase_options.dart'; // Importamos firebase_options de la base de datos del profesor

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(UserList());
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Chat(),
      debugShowCheckedModeBanner: false,
    );
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
      appBar: AppBar(
        title: Text("Mensajería"),
        actions: [
          // Botón para eliminar todos los datos
          IconButton(
            onPressed: () async {
              await eliminadoInfinito(messagesStream);
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(Icons.warning_amber, color: Colors.amber),
            ),
          ),
          // Botón para la eliminación de todos los mensajes de mensajería
          IconButton(
            onPressed: () async {
              await eliminarMensajeria(messagesStream);
            },
            icon: Icon(Icons.delete_sweep_outlined),
            color: Colors.red,
          ),
        ],
      ),
      // La columna principal
      body: Column(
        children: [
          Expanded(
            flex: 7,
            // StreamBuilder -> Bloque que hace setState() solo cuando recibe datos del Stream
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesStream.orderBy("date").snapshots(),
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
                      /* Guardamos la fecha obtenida del mapa, pero lo ponemos como tipo dinámico porque
                       no sabemos si vamos a recibir un TimeStamp u otra cosa, por lo que nos puede dar error */
                      dynamic fecha = datos["date"];
                      // 'is' es para castear la fecha a Timestam en caso de que sea
                      if (fecha is Timestamp) {
                        fecha = DateFormat.yMd().add_jm().format(
                          // toDate() -> Transforma la fecha a un String
                          fecha.toDate(),
                        );
                        // En caso de que sea otro tipo mostramos 'Sin fecha'
                      } else {
                        fecha = "Sin fecha";
                      }
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
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
                                  title: Text(
                                    datos['sender'] ?? "Sin remitente",
                                  ),
                                  subtitle: Text(
                                    datos['text'] ?? "Sin mensaje",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                // Formateamos la fecha con DateFormat.yMd().add_jm().format() pasádole la fecha
                                child: Text(fecha),
                              ),
                            ],
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
        "date": FieldValue.serverTimestamp(),
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

/// Esta función va a eliminar todos los datos de mensajería constantemente,
/// ya que abrimos un flujo que va a estar constatemente escuchando y
/// eliminando del flujo original
Future<void> eliminadoInfinito(CollectionReference messages) async {
  // snapshots() -> es un flujo abierto constantemente escuchando
  // NOTA: Stream.fromIterable() es el equivalente a stream() de Java, procesa elemento por elemento
  messages
      .snapshots()
      // Aplanamos como si de un flatMap se tratara con asyncExpand() cada QuerySnapshot aplanamos su lista de documents
      .asyncExpand((event) => Stream.fromIterable(event.docs))
      // Recorremos los documents y los casteamos como tal para poder llamar a su función delete()
      .forEach((element) async {
        // Eliminamos los documentos
        await (element as DocumentSnapshot).reference.delete();
      });
}

/// Esta función va a eliminar todos los datos que haya ese momento
/// en mensajería
Future<void> eliminarMensajeria(CollectionReference messages) async {
  /* Con get() obtenemos los mensajes por una SOLA foto pasada (QuerySnapshot),
  no un flujo de fotos que escuche constatemente que es con snapshots() */
  /* Cuando ha devuelto el Future el QuerySnapshot casteamos cada documento y
   mediante un for de estos los vamos eliminando, antes intenté hacerlo con
   asStream() pero cuando hacemos eso no mirbamos elemento por elemento de
   lo que contenía la lista, directamente mirábamos la lista completa, no
   funciona como en Java*/
  await messages.get().then((value) async {
    // Recorremos los documentos
    for (var element in value.docs) {
      // Se elimina en firebase
      await (element as DocumentSnapshot).reference.delete();
    }
  });
}
