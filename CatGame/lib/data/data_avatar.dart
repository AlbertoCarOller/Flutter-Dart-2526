import 'dart:math';

import 'package:flutter_application_cat_game/data/avatar.dart';

/// Contiene los datos con los que trabajares en nuestra App
/// Se puede añadir más funcionalidad.
class DataAvatar {
  static List<Map<String, dynamic>> rawData = [
    {
      "id": 1,
      "first_name": "Filip",
      "last_name": "Marlow",
      "age": 61,
      "job_title": "Recruiting Manager",
      "image": "/avatars/avatar_1.png",
    },
    {
      "id": 2,
      "first_name": "Evanne",
      "last_name": "Titherington",
      "age": 61,
      "job_title": "Assistant Manager",
      "image": "/avatars/avatar_2.png",
    },
    {
      "id": 3,
      "first_name": "Brnaby",
      "last_name": "Leuren",
      "age": 39,
      "job_title": "Nurse Practicioner",
      "image": "/avatars/avatar_3.png",
    },
    {
      "id": 4,
      "first_name": "Melinda",
      "last_name": "Toxell",
      "age": 89,
      "job_title": "Professor",
      "image": "/avatars/avatar_4.png",
    },
    {
      "id": 5,
      "first_name": "Elmo",
      "last_name": "Ciobotaro",
      "age": 97,
      "job_title": "Geological Engineer",
      "image": "/avatars/avatar_5.png",
    },
    {
      "id": 6,
      "first_name": "Daisie",
      "last_name": "Hawkswood",
      "age": 78,
      "job_title": "Therapist",
      "image": "/avatars/avatar_6.png",
    },
    {
      "id": 7,
      "first_name": "Irv",
      "last_name": "Dooley",
      "age": 66,
      "job_title": "Development Analyst",
      "image": "/avatars/avatar_7.png",
    },
    {
      "id": 8,
      "first_name": "Nickolai",
      "last_name": "Silberschatz",
      "age": 50,
      "job_title": "Actuary",
      "image": "/avatars/avatar_8.png",
    },
    {
      "id": 9,
      "first_name": "Ole",
      "last_name": "Shaddick",
      "age": 24,
      "job_title": "Junior Executive",
      "image": "/avatars/avatar_9.png",
    },
    {
      "id": 10,
      "first_name": "Hal",
      "last_name": "Dunsford",
      "age": 21,
      "job_title": "Senior Developer",
      "image": "/avatars/avatar_10.png",
    },
    {
      "id": 11,
      "first_name": "Eartha",
      "last_name": "Lascell",
      "age": 93,
      "job_title": "General Manager",
      "image": "/avatars/avatar_11.png",
    },
    {
      "id": 12,
      "first_name": "Lowell",
      "last_name": "Hayth",
      "age": 64,
      "job_title": "Media Manager IV",
      "image": "/avatars/avatar_12.png",
    },
    {
      "id": 13,
      "first_name": "Kordula",
      "last_name": "Bulger",
      "age": 29,
      "job_title": "Quality Engineer",
      "image": "/avatars/avatar_13.png",
    },
    {
      "id": 14,
      "first_name": "Reinald",
      "last_name": "Middlemass",
      "age": 21,
      "job_title": "Accountant II",
      "image": "/avatars/avatar_14.png",
    },
    {
      "id": 15,
      "first_name": "Thornton",
      "last_name": "Ricioppo",
      "age": 99,
      "job_title": "Senior Editor",
      "image": "/avatars/avatar_15.png",
    },
    {
      "id": 16,
      "first_name": "Shaina",
      "last_name": "Denes",
      "age": 59,
      "job_title": "Help Desk",
      "image": "/avatars/avatar_16.png",
    },
    {
      "id": 17,
      "first_name": "Jada",
      "last_name": "Summersby",
      "age": 100,
      "job_title": "Quality Engineer",
      "image": "/avatars/avatar_17.png",
    },
    {
      "id": 18,
      "first_name": "Alanna",
      "last_name": "Diboll",
      "age": 20,
      "job_title": "Junior Executive",
      "image": "/avatars/avatar_18.png",
    },
    {
      "id": 19,
      "first_name": "Aline",
      "last_name": "Innocenti",
      "age": 87,
      "job_title": "Product Engineer",
      "image": "/avatars/avatar_19.png",
    },
    {
      "id": 20,
      "first_name": "Ketty",
      "last_name": "Dallison",
      "age": 93,
      "job_title": "Therapy Assistant",
      "image": "/avatars/avatar_20.png",
    },
    {
      "id": 21,
      "first_name": "Kipper",
      "last_name": "Cumbridge",
      "age": 61,
      "job_title": "Operator",
      "image": "/avatars/avatar_21.png",
    },
    {
      "id": 22,
      "first_name": "Duke",
      "last_name": "Grimsditch",
      "age": 78,
      "job_title": "Officer",
      "image": "/avatars/avatar_22.png",
    },
    {
      "id": 23,
      "first_name": "Ginelle",
      "last_name": "Di Napoli",
      "age": 18,
      "job_title": "Actuary",
      "image": "/avatars/avatar_23.png",
    },
    {
      "id": 24,
      "first_name": "Karee",
      "last_name": "Izaac",
      "age": 88,
      "job_title": "Financial Analyst",
      "image": "/avatars/avatar_24.png",
    },
    {
      "id": 25,
      "first_name": "Nikolos",
      "last_name": "Seamon",
      "age": 67,
      "job_title": "Clinical Specialist",
      "image": "/avatars/avatar_25.png",
    },
    {
      "id": 26,
      "first_name": "Lock",
      "last_name": "Challender",
      "age": 30,
      "job_title": "Pharmacist",
      "image": "/avatars/avatar_26.png",
    },
    {
      "id": 27,
      "first_name": "Annabel",
      "last_name": "Santi",
      "age": 49,
      "job_title": "Design Engineer",
      "image": "/avatars/avatar_27.png",
    },
    {
      "id": 28,
      "first_name": "Corrina",
      "last_name": "Strothers",
      "age": 92,
      "job_title": "Associate Professor",
      "image": "/avatars/avatar_28.png",
    },
    {
      "id": 29,
      "first_name": "Dorrie",
      "last_name": "Hurley",
      "age": 39,
      "job_title": "Staff Accountant",
      "image": "/avatars/avatar_29.png",
    },
    {
      "id": 30,
      "first_name": "Shayne",
      "last_name": "Rove",
      "age": 74,
      "job_title": "Paralegal",
      "image": "/avatars/avatar_30.png",
    },
    {
      "id": 31,
      "first_name": "Pamela",
      "last_name": "Fieller",
      "age": 74,
      "job_title": "Biostatistician",
      "image": "/avatars/avatar_31.png",
    },
    {
      "id": 32,
      "first_name": "Verne",
      "last_name": "Mateos",
      "age": 83,
      "job_title": "Officer",
      "image": "/avatars/avatar_32.png",
    },
    {
      "id": 33,
      "first_name": "Cathy",
      "last_name": "Sealove",
      "age": 40,
      "job_title": "Programmer",
      "image": "/avatars/avatar_33.png",
    },
    {
      "id": 34,
      "first_name": "Chico",
      "last_name": "Badder",
      "age": 65,
      "job_title": "Accountant",
      "image": "/avatars/avatar_34.png",
    },
    {
      "id": 35,
      "first_name": "Anabal",
      "last_name": "Littledike",
      "age": 94,
      "job_title": "Internal Auditor",
      "image": "/avatars/avatar_35.png",
    },
    {
      "id": 36,
      "first_name": "Meridith",
      "last_name": "Draijer",
      "age": 33,
      "job_title": "Senior Engineer",
      "image": "/avatars/avatar_36.png",
    },
    {
      "id": 37,
      "first_name": "Tamar",
      "last_name": "Dannett",
      "age": 95,
      "job_title": "Financial Advisor",
      "image": "/avatars/avatar_37.png",
    },
    {
      "id": 38,
      "first_name": "Shawnee",
      "last_name": "Pollicatt",
      "age": 53,
      "job_title": "Budget Analyst",
      "image": "/avatars/avatar_38.png",
    },
    {
      "id": 39,
      "first_name": "Helli",
      "last_name": "Akess",
      "age": 30,
      "job_title": "Sales Representative",
      "image": "/avatars/avatar_39.png",
    },
  ];

  // Creamos una función que va a trasformar esta lista a objetos Avatar
  static List<Avatar> obetenerListaAvatares() {
    return rawData.map((e) {
      return Avatar(
        id: e.values.elementAt(0),
        firstName: e.values.elementAt(1),
        lastName: e.values.elementAt(2),
        age: e.values.elementAt(3),
        jobTitle: e.values.elementAt(4),
        image: e.values.elementAt(5),
      );
    }).toList();
  }

  // Guardamos el número de oponentes elegidos en términos y condiciones
  static int numOponentes = 1;

  // Guardamos el índice del avatar elegido por el usuario
  static int indexElegido = -1;

  // Guardamos el número de oponentes elegidos en la pantalla de oponentes
  static int numOponentesSeleccionados = 0;

  // Hacemos una función que va a devolver una lista de avatares disponibles para elegir oponentes
  static List<Avatar> obtenerOponentes() {
    // Obtenemos todos los avatares
    List<Avatar> avataresGenerales = obetenerListaAvatares();
    // Quitamos el avatar que hemos elegido, en caso de que sea distinto a -1
    indexElegido != -1 ? avataresGenerales.removeAt(indexElegido) : null;
    // Devolvemos la sublista con el número de oponentes que elegimos en términos y condiciones
    return avataresGenerales.sublist(0, numOponentes);
  }

  // Generamos una lista de números entre el 0 y el 1 para comparar después y ver si están rotos o no
  static List<int> generarCristales() {
    List<int> lista = [];
    Random r = Random();
    for (int i = 0; i < 8; i++) {
      lista.add(r.nextInt(2));
    }
    return lista;
  }

  // Devolvemos el número de vidas que va a tener el usuario de 1 al número de oponentes que ha seleccionado
  static int generarVidas() {
    Random r = Random();
    int numGenerado = r.nextInt(numOponentesSeleccionados);
    return numGenerado == 0 ? 1 : numGenerado;
  }
}
