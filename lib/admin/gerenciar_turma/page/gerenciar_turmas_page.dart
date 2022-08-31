import 'package:cefops_controll_acess/admin/gerenciar_turma/bloc/gerenciar_turma_bloc.dart';
import 'package:cefops_controll_acess/admin/gerenciar_turma/bloc/gerenciar_turma_event.dart';
import 'package:cefops_controll_acess/admin/gerenciar_turma/bloc/gerenciar_turma_state.dart';
import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/themes/app_colors.dart';

class GerenciarTurmasPage extends StatelessWidget {
  const GerenciarTurmasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GerenciarTurmaBloc bloc = Modular.get<GerenciarTurmaBloc>();

    return EsqueletoPaginasApp(
        ativarBotaoFlutuante: true,
        botao: button(context),
        child: BlocProvider(
          create: (BuildContext context) => bloc..add(InitEvent()),
          child: Builder(builder: (context) => _buildPage(context)),
        ));
  }

  Widget _buildPage(BuildContext context) {

    return BlocBuilder<GerenciarTurmaBloc, GerenciarTurmaState>(
        bloc: Modular.get<GerenciarTurmaBloc>(),
        builder: (context, state) {
          final bloc = Modular.get<GerenciarTurmaBloc>();
          print(state);
          return SizedBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [Text("Gerenciar Turmas")],
          ));
        });
  }

  FloatingActionButton button(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.blue,
      child: const Icon(
        Icons.add,
        color: AppColors.orange,
      ),
      onPressed: () {},
    );
  }
}
