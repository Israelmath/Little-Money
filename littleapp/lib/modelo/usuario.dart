import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario extends UsuarioBase with _$Usuario {
  Usuario();

  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);

  void prettyPrint() {
    Map<String, dynamic> data = this.toJson();
    String prettyString = JsonEncoder.withIndent("   ").convert(data);
    prettyString.split('\n').forEach((dynamic element) => print(element));
  }

  Usuario deepCopy(Usuario itemASerCopiado) => new Usuario.fromJson(jsonDecode(jsonEncode(itemASerCopiado)));
}

abstract class UsuarioBase with Store {

  @observable
  int? usuarioId;

  @observable
  String? nome;

  @observable
  String? sobrenome;

  @observable
  String? apelido;

  @observable
  DateTime? dataNascimento;

  @observable
  bool? ativo;

  @observable
  DateTime? dataUltAlt;

  @observable
  DateTime? dataCadastro;
}
