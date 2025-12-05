import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/data_avatar.dart';

class Winner extends StatelessWidget {
  const Winner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Winner')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${DataAvatar.obetenerListaAvatares().elementAt(DataAvatar.indexElegido).image}",
              height: 32,
            ),
            Text(
              "¡Felicidades has ganado!",
              style: GoogleFonts.actor(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
