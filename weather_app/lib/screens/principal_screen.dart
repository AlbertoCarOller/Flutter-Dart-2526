import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; /* -> Importamos el paquete para obtener la geolocalización,
 es MUY IMPORTANTE tener en cuenta que este paquete devuelve una lista de Location de las ciudades,
 porque puede haber varias ciudades que se llamen igual en diferentes países, la primera suele ser la
 más famosa*/
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart'
    as http; // -> Para acceder a las APIs, en este caso la del tiempo
import 'package:weather_app/model/weather.dart'; // Para obtener la ubicación actual

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  // Creamos un Location, se guardará la latitud y longitud de la ciudad concreta
  Location? locationExterno;

  // Creamos un Position donde guardaremos la posición actual del usuario
  Position? positionActual;

  // Creamos un el controllador de un textFormField de la ubicación pasada por el usuario
  final _textUbicaion = TextEditingController();

  // Creamos una vareiable donde vamos a guardar el nombre de la ubicación del usuario
  String? ubicaion;

  // Creamos una variable que va a almacenar el nombre de la ciudad buscada por el usuario
  String? ciudadPais;

  // Creamos una variable que va a almacenar los datos de la API de la ubicación actual
  Weather? weather;

  // Creamos un índice, este recoge la hora seleccionada por el usuario
  int indexSeleccion = 0;

  // Creamos un scrollController
  ScrollController sc = ScrollController();

  @override
  void initState() {
    super.initState();
    _textUbicaion.addListener(() => print(_textUbicaion.text));
    sc.addListener(() => print("${sc.position.pixels}"));
    // Se pueden utilizar funciones asíncronas pero no darle valor a una variable si viene de una
    cargarDatosActual();
  }

  @override
  void dispose() {
    _textUbicaion.dispose();
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.grey.shade400,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.sunny_snowing),
          ),
        ],
        title: SizedBox(
          width: 400,
          child: TextFormField(
            controller: _textUbicaion,
            decoration: InputDecoration(
              label: Text("Ciudad y país"),
              icon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Tu ubicación"), Icon(Icons.location_on)],
              ),
              // La ubicación para saber el tiempo (nombre de la ciudad)
              Text(
                ubicaion == null ? "Por determinar" : ubicaion!,
                style: TextStyle(fontSize: 20),
              ),
              // Obtenemos la fecha actual
              Text(
                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Imagen dependiendo de si está nublado en el momento o no
                    Expanded(
                      child: Image.asset(
                        weather != null
                            ? (weather!.hourly!.cloudCover.elementAt(
                                            indexSeleccion,
                                          ) >=
                                          50 &&
                                      weather!.hourly!.cloudCover.elementAt(
                                            indexSeleccion,
                                          ) <
                                          100
                                  ? "assets/images/parcialmenteNublado.png"
                                  : weather!.hourly!.cloudCover.elementAt(
                                          indexSeleccion,
                                        ) ==
                                        100
                                  ? "assets/images/nublado.png"
                                  : "assets/images/soleado.png")
                            : "assets/images/soleado.png",
                        scale: 3,
                      ),
                    ),
                    // Columna que contiene los grados y debajo de esta si está nublado y demás
                    Expanded(
                      child: Column(
                        children: [
                          // Grados
                          Text(
                            weather != null
                                ? "${weather!.hourly!.temperature2M.elementAt(indexSeleccion)}°C"
                                : "_Cº",
                            style: TextStyle(fontSize: 30),
                          ),
                          // 'Parcialmente nublado', 'Nublado' o 'Soleado'
                          Text(
                            weather != null
                                ? (weather!.hourly!.cloudCover.elementAt(
                                                indexSeleccion,
                                              ) >=
                                              50 &&
                                          weather!.hourly!.cloudCover.elementAt(
                                                indexSeleccion,
                                              ) <
                                              100
                                      ? "Parcialmente nublado"
                                      : weather!.hourly!.cloudCover.elementAt(
                                              indexSeleccion,
                                            ) ==
                                            100
                                      ? "Nublado"
                                      : "Soleado")
                                : "Por determinar",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Row donde van las 4 cards de información básica
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 4; i++)
                      // La card personalizada en caso de que 'weather no sea null'
                      weather != null
                          ? CardPersonalizada(
                              indexFor: i,
                              weather: weather!,
                              indexUser: indexSeleccion,
                            )
                          : Text("No disponible"),
                  ],
                ),
              ),
              // Este es el apartado donde aparecen las cards de las horas
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: sc,
                child: Row(
                  children: [
                    for (int i = 0; i < 24; i++)
                      weather != null
                          ? GestureDetector(
                              // Al pulsar cambiamos por el índice que está seleccionado
                              onTap: () {
                                setState(() {
                                  indexSeleccion = i;
                                });
                              },
                              child: CardHora(
                                indexFor: i,
                                weather: weather!,
                                currentIndex: indexSeleccion,
                              ),
                            )
                          : Text("No disponible "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Esta función va a cargar los datos necesarios de la
  /// ubicación actual del usuario, se pone dentro de la clase
  /// para acceder a las variables
  Future<void> cargarDatosActual() async {
    // Cargamos el 'Position' actual del usuario
    positionActual = await obtenerGeolocalizacionActual();
    print("Posición actual del usuario: $positionActual");
    // Cargamos el nombre de la ciudad del usuario
    if (positionActual != null) {
      ubicaion = await obtenerNombreCiudad(positionActual!);
    }
    // Cargamos el objeto Weather
    if (positionActual != null) {
      weather = await cargarWeatherActual(positionActual!);
    }
    // Redibujamos la pantalla
    setState(() {});
  }
}

/// Esta función va a devolver un objeto 'Location', este contiene
/// la latitud y longitud de la ciudad del país pasado, PERO en
/// caso de que esta dirección no exista se devolverá null
Future<Location?> obtenerGeolocalizacionCiudad(String ciudadYPais) async {
  try {
    // Tratamos el String para separar la ciudad del país
    List<String> campos = ciudadYPais.split(",").map((e) => e.trim()).toList();
    if (campos.length != 2) {
      return null;
    }
    String ciudad = campos.first;
    String pais = campos.elementAt(1);
    /* Almacenamos la lista de Location que obtenemos al pasar una ciudad y país,
   como hace una petición se le pone 'await', se le puede pasar solo la ciudad
    pero en este caso vamos a pasarle el país también para ser más concretos*/
    List<Location> ciudades = await locationFromAddress("$ciudad, $pais");
    // En caso de que no se encuentre la ciudad, devolvemos null
    if (ciudades.isEmpty) {
      return null;
    }
    // En caso de que no de excepción y la lista no esté vacía devolvemos la primera, que suele ser la más exacta
    return ciudades.first;
    // En caso de que salte excepción se devolverá un null
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

/// Esta función va a devolver 'Position' que contiene
/// la latitud y longitud de la posición actual del usuario
Future<Position?> obtenerGeolocalizacionActual() async {
  try {
    // Si el usuario tiene activo el GPS independientemente de la app, entramos
    if (await Geolocator.isLocationServiceEnabled()) {
      // Chekeamos si estamos ya en la lista de permitidos (GPS)
      LocationPermission checkPermissions = await Geolocator.checkPermission();
      // Si no estamos en la lista de permitidos, lanzamos la solicitud
      if (checkPermissions != LocationPermission.always &&
          checkPermissions != LocationPermission.whileInUse) {
        // Hacemos que le aparezca al usuario una ventana y nos devuelve si permite o no la ubicación en nuestra app
        LocationPermission requestPermission =
            await Geolocator.requestPermission();
        // Si tiene los permisos necesarios devuelve la posición
        if (requestPermission == LocationPermission.always ||
            requestPermission == LocationPermission.whileInUse) {
          // Con getCurrentPosition obtenemos la posición actual
          return await Geolocator.getCurrentPosition(
            // Con LocationAccuracy.high le damos más potencia de precisión
            locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
            // Con then() obtenemos el valor devuelto una vez que se ha esperado lo correspondiente
          );
        }
        // En caso de que no lo haya querido activar
        return null;
      }
      // En caso de que ya estuviéramos en lista manda los datos
      return await Geolocator.getCurrentPosition(
        // Con LocationAccuracy.high le damos más potencia de precisión
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
        // Con then() obtenemos el valor devuelto una vez que se ha esperado lo correspondiente
      );
    }
  } catch (e) {
    print("Error: $e");
    // En caso de que ocurra un error
    return null;
  }
  // En caso de que no tenga el GPS (en su móvil, independiente de la app) activo
  return null;
}

Future<String?> obtenerNombreCiudad(Position position) async {
  try {
    /* Obtenemos una lista de 'Placemark' que es un objeto que contiene
  * información sobre la ubicación, el más fiable suele ser siempre el primero de la lista */
    List<Placemark> ubicacionEmpaquetada = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    // Devolvemos el nombre de la localidad
    return ubicacionEmpaquetada.first.locality;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

/// Esta función va a devolver un objeto Weather que contiene la información
/// del tiempo de la ubicación del tiempo actual
Future<Weather?> cargarWeatherActual(Position position) async {
  try {
    // Hacemos una petición a la API para obtener información en formato JSON
    http.Response response = await http.get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=${position.latitude}"
        "&longitude=${position.longitude}&daily=temperature_2m_max,"
        "temperature_2m_min&hourly=temperature_2m,precipitation_probability,"
        "cloud_cover,wind_speed_10m&timezone=Europe%2FBerlin&forecast_days=1",
      ),
    );
    // Devolvemos el objeto, con 'fromJson' el mapa lo transforma en el objeto
    return Weather.fromJson(jsonDecode(response.body));
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

/// Este widget va a tener una columna con la información, incluyendo la card
/// de cada sección que se necesita saber del tiempo
class CardPersonalizada extends StatelessWidget {
  // Pasamos el índice que va a representar que hora ha elegido el usurio
  final int indexUser;

  // El ídice del for, el que llega desde arriba, para saber que mostrar
  final int indexFor;

  // Alamacenamos el objeto Weather
  final Weather weather;

  const CardPersonalizada({
    super.key,
    required this.indexFor,
    required this.weather,
    required this.indexUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        Card(
          color: Colors.grey.shade400,
          child: SizedBox(
            width: 50,
            height: 50,
            // La imagen dependiendo del índice de del for
            child: Image.asset(
              indexFor == 0
                  ? "assets/images/termometro.png"
                  : indexFor == 1
                  ? "assets/images/nublado.png"
                  : indexFor == 2
                  ? "assets/images/gotaAgua.png"
                  : "assets/images/viento.png",
              scale: 15,
            ),
          ),
        ),
        // Texto que aparece justo debajo de la card
        Text(
          indexFor == 0
              ? "Mínima-máxima"
              : indexFor == 1
              ? "Nubosidad"
              : indexFor == 2
              ? "Precipitaciones"
              : "Viento",
        ),
        // Texto que contiene la información
        Text(
          indexFor == 0
              /* Con RegExp(r'[\[\]]') creamos una expresión regular, en este caso con 'r'
          * le decimos que las \ sean para escapar y no haya que poner doble \\ */
              ? "${weather.daily!.temperature2MMin.toString().split(RegExp(r'[\[\]]')).elementAt(1)}º"
                    "-${weather.daily!.temperature2MMax.toString().split(RegExp(r'[\[\]]')).elementAt(1)}º"
              : indexFor == 1
              ? "${weather.hourly!.cloudCover.elementAt(indexUser)}%"
              : indexFor == 2
              ? "${weather.hourly!.precipitationProbability.elementAt(indexUser)}"
              : "${weather.hourly!.windSpeed10M.elementAt(indexUser)} km/h",
        ),
      ],
    );
  }
}

class CardHora extends StatelessWidget {
  // El índice del for exterior
  final int indexFor;

  // El objeto weather
  final Weather weather;

  // El índice seleccionado por el usuario, para saber de que color debe estar la card
  final int currentIndex;

  const CardHora({
    super.key,
    required this.indexFor,
    required this.weather,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: currentIndex == indexFor
          ? Colors.purple.shade400
          : Colors.grey.shade400,
      child: SizedBox(
        height: 110,
        width: 70,
        child: Stack(
          children: [
            // La hora
            Positioned(
              top: 4,
              right: 2,
              left: 2,
              child: Text(
                weather.hourly!.time
                    .elementAt(indexFor)
                    .toString()
                    .split("T")
                    .elementAt(1),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 2,
              right: 2,
              bottom: 2,
              top: 2,
              child: Image.asset(
                weather.hourly!.cloudCover.elementAt(indexFor) >= 50 &&
                        weather.hourly!.cloudCover.elementAt(indexFor) < 100
                    ? "assets/images/parcialmenteNublado.png"
                    : weather.hourly!.cloudCover.elementAt(indexFor) == 100
                    ? "assets/images/nublado.png"
                    : "assets/images/soleado.png",
                scale: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
