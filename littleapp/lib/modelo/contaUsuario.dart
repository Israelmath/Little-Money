import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'contaUsuario.g.dart';

@JsonSerializable()
class ContaUsuario extends ContaUsuarioBase with _$ContaUsuario {
  ContaUsuario();

  factory ContaUsuario.fromJson(Map<String, dynamic> json) => _$ContaUsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$ContaUsuarioToJson(this);

  void prettyPrint() {
    Map<String, dynamic> data = this.toJson();
    String prettyString = const JsonEncoder.withIndent("   ").convert(data);
    prettyString.split('\n').forEach((dynamic element) => print(element));
  }

  ContaUsuario deepCopy(ContaUsuario itemASerCopiado) => new ContaUsuario.fromJson(jsonDecode(jsonEncode(itemASerCopiado)));
}

abstract class ContaUsuarioBase with Store {
  @observable
  late int contaId;

  @observable
  late int usuarioId;

  @observable
  double? saldo;

  @observable
  String? observacao;

  @observable
  late bool ativo;

  @observable
  late DateTime dataUltAlt;

  @observable
  late DateTime dataCadastro;
}