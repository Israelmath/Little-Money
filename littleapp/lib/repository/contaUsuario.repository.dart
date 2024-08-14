import 'dart:io';

import 'package:littleapp/modelo/tarefaItem.dart';
import 'package:littleapp/util/httpClient.dart';

import '../modelo/contaUsuario.dart';

class ContaUsuarioRepositorio {
  final HttpClient _api = HttpClient();

  Future<ContaUsuario> buscaContaUsuario(int usuarioId) async {
    Map<String, dynamic> response = await _api.get("/conta/minhaConta/$usuarioId/");

    return ContaUsuario.fromJson(response);
  }
}