// const AssetImage("assets/images/planets/saturno.png")

import 'dart:math';

import 'package:flutter/material.dart';

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
  switch (tema){
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