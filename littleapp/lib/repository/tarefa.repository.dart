import 'dart:io';

import 'package:littleapp/modelo/tarefaItem.dart';
import 'package:littleapp/util/httpClient.dart';

class TarefaRepositorio {
  final HttpClient _api = HttpClient();

  Future<List<TarefaItem?>> buscaTarefasDeHoje(int usuarioId) async {
    List<dynamic> response = await _api.get("/tarefaItem/tarefasDeHoje/$usuarioId/");
    List<TarefaItem> listaTarefas = [];

    for (Map<String, dynamic> tarefa in response) {
      listaTarefas.add(TarefaItem.fromJson(tarefa));
    }

    return listaTarefas;
  }
}