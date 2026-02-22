import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/firebase_options.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';
import 'package:tienda_online/provider/TemaProvider.dart';
import 'package:tienda_online/screens/carro_screen.dart';
import 'package:tienda_online/screens/login_screen.dart';
import 'package:tienda_online/screens/producto_screen.dart';
import 'package:tienda_online/screens/register_screen.dart';
import 'package:tienda_online/utils/first_screen.dart';

void main() async {
  // Contruimos el puente entre Flutter y Dart antes de iniciar el runApp()
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    // Creamos un MultiProvider para los diferentes provider que tiene la App
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TemaProvider()),
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
      ],
      child: PrincipalTienda(),
    ),
  );
}

class PrincipalTienda extends StatefulWidget {
  const PrincipalTienda({super.key});

  @override
  State<PrincipalTienda> createState() => _PrincipalTiendaState();
}

class _PrincipalTiendaState extends State<PrincipalTienda> {
  @override
  Widget build(BuildContext context) {
    // Creamos una instancia de TemaProvider que escucha constantemente los cambios para reconstruir
    final temaProvider = context
        .watch<TemaProvider>()
        .temaActual; // Vigilamos el tema actual
    // El tema por defecto (claro)
    final tema = ThemeData(
      // Generamos colores a partir de un color semilla
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple.shade400,
        // Al generar los colores le decimos que es para un tema claro
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      // La tipografía
      textTheme: GoogleFonts.aBeeZeeTextTheme(),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
    );
    // El tema oscuro
    final darkTema = ThemeData(
      // Generamos colores a partir de un color semilla
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple.shade300,
        // Al generar los colores le decimos que es para un tema oscuro
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      // La tipografía
      textTheme: GoogleFonts.aBeeZeeTextTheme(),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
    );
    return MaterialApp(
      // Ponemos como tema predeterminado el modo claro
      themeMode: temaProvider,
      debugShowCheckedModeBanner: false,
      title: "PrincipalTienda",
      theme: tema,
      darkTheme: darkTema,
      initialRoute: "/",
      routes: {
        // Decidimos donde viajamos dependiendo de si está o no logueado el usuario
        "/": (context) => FirstScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/producto_screen": (context) => ProductoScreen(),
        "/carro_screen": (context) => CarroScreen(),
        //"/tienda_screen": (context) => TiendaScreen(),
      },
    );
  }
}
