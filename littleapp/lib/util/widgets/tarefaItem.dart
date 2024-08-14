import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:littleapp/modelo/tarefaItem.dart';

class TarefaItemCard extends StatelessWidget {
  final TarefaItem item;

  const TarefaItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    double lWidth = MediaQuery.sizeOf(context).width;
    double lHeight = MediaQuery.sizeOf(context).height;

    return Container(
      width: lWidth,
      height: lHeight * .1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow( color: Colors.grey.withOpacity(.3), offset: const Offset(2, 2))],
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              // Ícone
              padding: const EdgeInsets.only(right: 16),
              child: _esquerda(),
            ),

            _centro(), // Conteúdo central

            Padding(
              // Botão menu
              padding: const EdgeInsets.only(left: 16),
              child: _direita(lWidth),
            ),
          ],
        ),
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
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          Text(
            item.descricao != null
                ? utf8.decode(item.descricao!.codeUnits)
                : '',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 12),
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
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 10),
          ),
        ), // Valor acrescimo

        const SizedBox(width: 12),

        Container(
          decoration: const BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Text(
            ' R\$ ${item.valorDesconto} ',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 10),
          ),
        ), // Valor desconto

        const SizedBox(width: 24),

        Text('Hora restante: 5 minutos',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 10))
      ],
    );
  }

  Widget _direita(double width) {
    return SizedBox(width: width * .1, child: const Icon(Icons.more_vert));
  }
}
