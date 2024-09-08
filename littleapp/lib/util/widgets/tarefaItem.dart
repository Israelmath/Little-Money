import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:littleapp/modelo/tarefaItem.dart';
import 'package:littleapp/util/design.dart';
import 'package:littleapp/util/util.dart';

class TarefaItemCard extends StatelessWidget {
  final TarefaItem item;

  const TarefaItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    double lWidth = MediaQuery.sizeOf(context).width;
    double lHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: lWidth * .8,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: lWidth * .01,
            height: lHeight * .1,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(4))),
          ),
          const SizedBox(width: 8),
          Padding(
            // Ícone
            padding: const EdgeInsets.only(right: 16),
            child: _esquerda(),
          ),

          _centro(), // Conteúdo central

          _direita(lWidth),
        ],
      ),
    );
  }

  Widget _esquerda() {
    return CircleAvatar(
      backgroundColor: Colors.green.shade100,
      child: const Image(
        image: AssetImage('assets/images/tarefas.png'),
        width: 30,
        height: 30,
      ),
    );
  }

  Widget _centro() {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            utf8.decode(item.titulo.codeUnits),
            style: LittleTextStyle.poppinsM,
          ),
          Text(
            item.descricao != null
                ? utf8.decode(item.descricao!.codeUnits)
                : '',
            style: LittleTextStyle.robotoP,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          _rodape()
        ],
      ),
    );
  }

  Row _rodape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Text(
            ' R\$ ${item.valorAcrescimo} ',
            style: LittleTextStyle.robotoPP,
          ),
        ), // Valor acrescimo

        const SizedBox(width: 12),

        Container(
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(
            ' R\$ ${item.valorDesconto} ',
            style: LittleTextStyle.robotoPP,
          ),
        ), // Valor desconto

        const SizedBox(width: 24),

        Text('Tempo restante: ${tempoRestante(item.dataItem)}',
            style: LittleTextStyle.robotoPP),
      ],
    );
  }

  Widget _direita(double width) {
    return SizedBox(width: width * .1, child: const Icon(Icons.more_vert));
  }
}
