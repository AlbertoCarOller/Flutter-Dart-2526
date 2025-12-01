import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Godzilla Web',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PantallaGodzilla(),
    );
  }
}

class PantallaGodzilla extends StatelessWidget {
  const PantallaGodzilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/Godzilla.png'),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              alignment: Alignment.center,
              height: 150,
              width: 400,
              color: Color.fromRGBO(15, 115, 186, 1.0),
              child: Text(
                "BUY TICKETS",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: -35,
            child: SizedBox(
              width: 800,
              height: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/HBO.png'),
                  Image.asset('images/IMAX.png'),
                  Image.asset('images/legendary.png'),
                ],
              ),
            ),
          ),
          Positioned(
            left: 80,
            bottom: 350,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    "GODZILLA II",
                    style: GoogleFonts.lora(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: Color.fromRGBO(19, 221, 240, 1.0),
                    ),
                  ),
                  Text(
                    "THE KING OF MONSTERS",
                    style: TextStyle(fontSize: 46, color: Colors.white),
                  ),
                  Text(
                    "The Legendary Titan Godzilla Returns To Face His Greatest\n"
                    "Challenge Yet - Three Ancient Super-Species Known As The Titans,\n"
                    "Awakened and Vying For Dominance . Only Godzilla can stand\n"
                    "Against Them, But To Restore Order And Save Humanity.He May\n"
                    "Need The Help Of Other Legendary Creatures,Like Mythical\n"
                    "Mothra And The Fiery Rodan. Prepare For A Spectacular Clash Of\n"
                    "Titans As The Fate Of The World Hangs In The Balance.\n",
                    style: TextStyle(
                      color: Color.fromARGB(120, 255, 255, 255),
                      fontWeight: FontWeight.w200,
                      wordSpacing: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
