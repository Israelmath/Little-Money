// const AssetImage("assets/images/planets/saturno.png")

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enums.dart';

AssetImage buscaIconeAleatorio(TemaIcone tema) {
  List listaAnimals = [
    const AssetImage("assets/images/animals/guaxinim.png"),
    const AssetImage("assets/images/animals/leao.png"),
    const AssetImage("assets/images/animals/tigre.png"),
  ];
  List listaNature = [
    const AssetImage("assets/images/nature/cactus.png"),
    const AssetImage("assets/images/nature/coffee.png"),
    const AssetImage("assets/images/nature/rose.png")
  ];
  List listaPlanets = [
    const AssetImage("assets/images/planets/saturno.png"),
    const AssetImage("assets/images/planets/venus.png"),
    const AssetImage("assets/images/planets/planeta1.png"),
    const AssetImage("assets/images/planets/planeta2.png"),
    const AssetImage("assets/images/planets/planeta3.png"),
    const AssetImage("assets/images/planets/planeta4.png"),
  ];
  List listaSea = [
    const AssetImage("assets/images/sea/algas-marinhas.png"),
    const AssetImage("assets/images/sea/baleia.png"),
    const AssetImage("assets/images/sea/caranguejo.png"),
    const AssetImage("assets/images/sea/enguia.png"),
    const AssetImage("assets/images/sea/peixe-palhaco.png"),
    const AssetImage("assets/images/sea/polvo.png")
  ];

  final random = Random();
  switch (tema) {
    case TemaIcone.sea:
      return listaSea[random.nextInt(listaSea.length)];

    case TemaIcone.animals:
      return listaAnimals[random.nextInt(listaAnimals.length)];

    case TemaIcone.nature:
      return listaNature[random.nextInt(listaNature.length)];

    case TemaIcone.planets:
      return listaPlanets[random.nextInt(listaPlanets.length)];
  }
}

class UIColor {
  UIColor._();

  static const Color primary = Color(0xFF3F51B5);
  static const Color primaryDark = Color(0xFF303F9F);
  static const Color primaryLight = Color(0xFFC5CAE9);
  static const Color secondary = Color(0xFF00BCD4);
  static const Color secondaryDark = Color(0xFF0097A7);
  static const Color secondaryLight = Color(0xFFB2EBF2);
  static const Color background = Color(0xFFE0E0E0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onError = Color(0xFFFFFFFF);
}

class LittleTextStyle {
  LittleTextStyle._();

  static TextStyle montserratP = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          offset: const Offset(1, 1),
          color: Colors.black.withOpacity(.2),
        ),
      ]);

  static TextStyle montserratM = GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          offset: const Offset(2, 2),
          color: Colors.black.withOpacity(.3),
        ),
      ]);

  static TextStyle montserratG = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: const Offset(2, 2),
        color: Colors.black.withOpacity(.5),
      ),
    ],
  );

  static TextStyle montserratMBlue = GoogleFonts.montserrat(
    color: Colors.blueAccent.shade700,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(
        offset: const Offset(1, 1),
        color: Colors.black.withOpacity(.1),
      ),
    ],
  );

  static TextStyle tekoM = GoogleFonts.teko(
    color: Colors.black45,
    fontSize: 24,
    fontWeight: FontWeight.w300,
  );

  static TextStyle poppinsM = GoogleFonts.poppins(fontWeight: FontWeight.w500);

  static TextStyle robotoPP = GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 10);

  static TextStyle robotoP = GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 12);

  // static
}
