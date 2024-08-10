import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'tarefaItem.g.dart';

@JsonSerializable()
class TarefaItem extends TarefaItemBase with _$TarefaItem {
  TarefaItem();

  factory TarefaItem.fromJson(Map<String, dynamic> json) => _$TarefaItemFromJson(json);

  Map<String, dynamic> toJson() => _$TarefaItemToJson(this);

  void prettyPrint() {
    Map<String, dynamic> data = this.toJson();
    String prettyString = JsonEncoder.withIndent("   ").convert(data);
    prettyString.split('\n').forEach((dynamic element) => print(element));
  }

  TarefaItem deepCopy(TarefaItem itemASerCopiado) => new TarefaItem.fromJson(jsonDecode(jsonEncode(itemASerCopiado)));
}

abstract class TarefaItemBase with Store {
  @observable
  late int tarefaId;

  @observable
  late int usuarioId;

  @observable
  late String titulo;

  @observable
  String? descricao;

  @observable
  late double valorAcrescimo;

  @observable
  double? valorDesconto;

  @observable
  late bool obrigatoria;

  @observable
  late DateTime dataItem;

  @observable
  late bool finalizado;

  @observable
  late bool pago;

  @observable
  late bool ativo;
}