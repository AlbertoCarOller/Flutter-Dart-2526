import 'package:flutter/material.dart';
import 'package:weather_app/Data/weather_data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Cargamos la función pasada por parámetros
    Function(String) function =
        ModalRoute.of(context)!.settings.arguments as Function(String);
    return Scaffold(
      appBar: AppBar(title: Text("Historial de búsquedas"), centerTitle: true),
      body: ListView.builder(
        itemCount: WeatherData.historialUbicaiones.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey,
            child: ListTile(
              // Al pulsar volvemos atrás cambiando el estado del Weather por el seleccionado
              onTap: () async {
                // Esperamos a que cargen los datos, a que termine la función
                await function(
                  WeatherData.historialUbicaiones.elementAt(index),
                );
                /* Con context.mounted nos aseguramos que si el usuario vuelve atrás
                * mientras aún está cargando los datos de la api, nos aseguramos si
                * esta pantalla sigue montada, es decir si el usuario le da a otros
                * botones externos a este y vuelve atrás, al hacer el pop dará error
                * porque el context ya no estará montado, por eso nos aseguramos antes,
                * OJO LA PANTALLA ESTARÑA MONTADA SIEMPRE QUE ESTÉ DENTRO DEL STACK */
                if (context.mounted) {
                  /* Bien ya sabemos que la pantalla está en el Stack, PERO NO QUE SEA LA ÚLTIMA, LA ACTIVA AHORA,
                  * por lo que si monto otra pantalla encima al hacer el pop quitará la última del Stack para cuando
                  * ha cargado la información de la API, esto lo solucionamos con isCurrent, es decir si es la actual,
                  * la que está activa ahora mismo en la pila, donde está el usuario */
                  if (ModalRoute.of(context)?.isCurrent == true) {
                    // Navegamos a la pantalla de atrás una vez que es seguro
                    Navigator.pop(context);
                  }
                }
              },
              title: Text(WeatherData.historialUbicaiones.elementAt(index)),
              trailing: Icon(Icons.history),
            ),
          );
        },
      ),
    );
  }
}
