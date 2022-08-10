import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/login_professor_entity.dart';
import 'package:cefops_controll_acess/core/erros/widgets/error_page.dart';
import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/themes/app_colors.dart';
import '../blocs/listar_turmas_bloc.dart';
import '../blocs/listar_turmas_event.dart';
import '../blocs/listar_turmas_state.dart';

class ListarTurmasPage extends StatelessWidget {
  final LoginProfessorEntity professor;
  final String hospitalEmail;

  const ListarTurmasPage({super.key, required this.professor, required this.hospitalEmail});

  @override
  Widget build(BuildContext context) {
    final ListarTurmasBloc bloc = Modular.get<ListarTurmasBloc>();
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) =>
            bloc..add(CarregandoEvent(idProfessor: professor.idProfessorReferencia)),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ListarTurmasBloc, ListarTurmasState>(
      bloc: BlocProvider.of<ListarTurmasBloc>(context),
      builder: (context, state) {

        if (state is ErrorState) {
          return ErrorTextWidget(message: (state.message +professor.nome));
        }

        if (state is CarregadoState) {
          return ListView.builder(
            itemCount: state.turmas.length,
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.04),
                    Text(
                      'Selecione Uma Turma',
                      style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: size.height * 0.1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blue,
                        onPrimary: AppColors.orange,
                        shadowColor: AppColors.orange,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        minimumSize: Size(150, 70),
                      ),
                      onPressed: () => Modular.to.pushNamed('./acao?idProfessor=${professor.idProfessorReferencia}&nomeProfessor=${professor.nome}&emailHospital=$hospitalEmail',
                          arguments: state.turmas[index]
                      ),
                      child: Text(
                        state.turmas[index].nome,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),

                  ],
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
