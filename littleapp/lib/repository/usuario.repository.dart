import 'dart:io';

import 'package:littleapp/util/httpClient.dart';

import '../modelo/usuario.dart';

class UsuarioRepositorio {
  final HttpClient api = HttpClient();

  Future<Usuario?> buscaUsuarioAtual() async {
    Map<String, dynamic> response = await api.get("/usuario/2");

    return Usuario.fromJson(response);
  }
}