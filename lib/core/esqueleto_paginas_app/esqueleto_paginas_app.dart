import 'package:flutter/material.dart';

class EsqueletoPaginasApp extends StatelessWidget {
  const EsqueletoPaginasApp({Key? key, required this.child, required this.ativarBotaoFlutuante, this.botao}) : super(key: key);
  final Widget child;
  final bool ativarBotaoFlutuante;
  final Widget? botao;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton:ativarBotaoFlutuante?botao:null ,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/brasao_azul.png"),
                  opacity: 0.09,
                  alignment: Alignment.bottomLeft,
                  scale: 0.7)),
          child: child,
        ),
      ),
    );
  }
}
