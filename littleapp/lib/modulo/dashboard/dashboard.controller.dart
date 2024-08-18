import 'package:flutter/material.dart';
import 'package:littleapp/repository/usuario.repository.dart';
import 'package:littleapp/util/widgets/tarefaItem.dart';
import 'package:mobx/mobx.dart';

import '../../modelo/contaUsuario.dart';
import '../../modelo/tarefaItem.dart';
import '../../modelo/usuario.dart';
import '../../repository/contaUsuario.repository.dart';
import '../../repository/tarefa.repository.dart';

part 'dashboard.controller.g.dart';

class DashboardController = DashboardControllerBase with _$DashboardController;

abstract class DashboardControllerBase with Store {
  UsuarioRepositorio usuarioRep = UsuarioRepositorio();
  TarefaRepositorio tarefaRep = TarefaRepositorio();
  ContaUsuarioRepositorio contaUsuarioRep = ContaUsuarioRepositorio();

  @observable
  Usuario usuarioAtual = Usuario();

  @observable
  ContaUsuario minhaConta = ContaUsuario();

  @observable
  List<TarefaItem?> listaTarefas = [];

  @action
  Future<bool> inicia(BuildContext context) async {
    await refreshDashboard();
    return true;
  }

  @action
  Future<bool> refreshDashboard() async {
    await buscaUsuario().then((_) async {
      await buscaTarefasDiarias();
      await buscaMinhaConta();
    });

    return true;
  }

  Future<bool> buscaUsuario() async {
    usuarioAtual = (await usuarioRep.buscaUsuarioAtual())!;
    return true;
  }

  Future<bool> buscaTarefasDiarias() async {
    listaTarefas = await tarefaRep.buscaTarefasDeHoje(usuarioAtual.usuarioId!);
    return true;
  }

  Future<bool> buscaMinhaConta() async {
    minhaConta = await contaUsuarioRep.buscaContaUsuario(usuarioAtual.usuarioId!);
    return true;
  }

  // bool criaTarefasDiarias() {
  //   if (listaTarefas.isEmpty) return false;
  //
  //   List<TarefaItemCard> listaTarefasDiarias = [];
  //
  //   for(TarefaItem? tarefa in listaTarefas) {
  //     listaTarefasDiarias.add(TarefaItemCard(tarefa!));
  //   }
  //
  //   listaTarefasCards = listaTarefasDiarias;
  //
  //   return true;
  // }


}