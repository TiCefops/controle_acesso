import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/assinatura_professor_bloc.dart';
import '../bloc/assinatura_professor_event.dart';


class AssinaturaProfessorPage extends StatelessWidget {
  const AssinaturaProfessorPage({Key? key, required this.professor}) : super(key: key);
  final String professor;

  @override
  Widget build(BuildContext context) {
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) => AssinaturaProfessorBloc()..add(InitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<AssinaturaProfessorBloc>(context);

    return Container(child: Text("PRofessor: $professor"),);
  }
}

