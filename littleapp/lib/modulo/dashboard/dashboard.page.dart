import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:littleapp/modelo/tarefaItem.dart';
import 'package:littleapp/modulo/dashboard/dashboard.controller.dart';
import 'package:littleapp/util/widgets/cardDashboard.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:littleapp/util/widgets/tarefaItem.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  late double w;
  late double h;
  DashboardController controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.sizeOf(context).width;
    h = MediaQuery.sizeOf(context).height;

    controller.inicia(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, child: _bgCompleto()),
          Positioned(top: 0, child: _bgCabecalho()),
          Positioned(top: h * .04, left: 4, child: _greetings()),
          Positioned(top: h * .15, left: w * .05, child: _cardsCabecalho()),
          Positioned(top: h * .4, left: w * .05, child: _tarefasSessao()),
        ],
      ),
    );
  }

  Widget _bgCompleto() {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 8,
              offset: const Offset(1, 1),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
    );
  }

  Widget _bgCabecalho() {
    return Container(
        width: w, height: h * .3, color: Colors.blueAccent.shade700);
  }

  Widget _greetings() {
    return Container(
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: w * .14,
                height: w * .14,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(w * .1)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        offset: const Offset(2, 2),
                        blurRadius: 8,
                      )
                    ]),
                child: Image(
                  image: const AssetImage('assets/images/usuario.png'),
                  height: h * .07,
                  width: h * .07,
                ),
              ),
              Text(
                'Boa noite,',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        color: Colors.black.withOpacity(.2),
                      ),
                    ]),
              ),
              Observer(builder: (BuildContext context) {
                return Text(
                  '${controller.usuarioAtual.apelido ?? controller.usuarioAtual.nome}',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        color: Colors.black.withOpacity(.2),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
          InkWell(
            onTap: controller.refreshDashboard,
            child: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _cardsCabecalho() {
    double wCard = w * .6;
    double hCard = 200;

    return SizedBox(
      width: w,
      height: 200,
      child: CarouselSlider(
        items: [
          Observer(
            builder: (_) => CardDashboard(controller.minhaConta, wCard, hCard),
          ),
          CardDashboard(controller.minhaConta, wCard, hCard),
          CardDashboard(controller.minhaConta, wCard, hCard),
        ],
        options: CarouselOptions(
          enableInfiniteScroll: false,
          aspectRatio: 2,
          viewportFraction: 0.62,
          enlargeCenterPage: true,
          animateToClosest: false,
        ),
      ),
    );
  }

  Widget _tarefasSessao() {
    return Observer(builder: (_) {
      return Container(
        width: w * .95,
        height: h * .4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // padding: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.only(top: 12, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TAREFA',
                    style: GoogleFonts.montserrat(
                        color: Colors.blueAccent.shade700,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 1),
                            color: Colors.black.withOpacity(.1),
                          ),
                        ]),
                  ),
                  Text(
                    ' de hoje',
                    style: GoogleFonts.teko(
                      color: Colors.black45,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            controller.listaTarefas.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Flexible(
                    child: Observer(builder: (_) {
                      return ListView(
                        children: [],
                      );

                      // return ListView.separated(
                      //   shrinkWrap: true,
                      //   separatorBuilder: (_, index) =>
                      //       const SizedBox(height: 12),
                      //   padding: const EdgeInsets.all(4),
                      //   itemCount: controller.listaTarefas.length,
                      //   itemBuilder: (_, index) => TarefaItemCard(controller.listaTarefas[index]!),
                      // );
                    }),
                  ),
          ],
        ),
        // child: ListView(
        //   children: controller.criaTarefasDiarias(),
        // ),
      );
    });
  }

  List<Widget> _carregaCardsTarefa() {
    List<TarefaItem?> lista = controller.listaTarefas;
    List<Widget> listaCards = [];

    for(TarefaItem? item in lista) {
      listaCards.add(Center(child: ,));
    }

    return listaCards;
  }
}
