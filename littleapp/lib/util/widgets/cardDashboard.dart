import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:littleapp/modelo/contaUsuario.dart';

import '../design.dart';
import '../enums.dart';
import '../util.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard(this.minhaConta, this.wCard, this.hCard, {super.key});

  final double wCard;
  final double hCard;
  final ContaUsuario minhaConta;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wCard,
      height: hCard,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: const Offset(3, 3),
            blurRadius: 8,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(.15))],
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 16,
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                ),
                child: Image(
                  image: buscaIconeAleatorio(TemaIcone.sea),
                  width: wCard * .25,
                  height: wCard * .25,
                ),
              ),
            ),
          ),
          Positioned(
            right: wCard * .1,
            top: 4,
            child: Text(
              'Saldo',
              style: LittleTextStyle.montserratG,
            ),
          ),
          Observer(builder: (_) {
            if (minhaConta.saldo == null) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            }

            return Positioned(
              top: hCard * .5 - 20,
              left: wCard * .5 - 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'R\$ ${integerPart(minhaConta.saldo)}',
                    style: LittleTextStyle.montserratG,
                  ),
                  Text(
                    ',${decimalPart(minhaConta.saldo)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          offset: const Offset(2, 2),
                          color: Colors.black.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
