import 'dart:convert';

import 'package:cefops_controll_acess/controle_acesso/listar_alunos/bloc/listar_alunos_state.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_alunos_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import 'package:cefops_controll_acess/core/erros/widgets/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signature/signature.dart';

import '../../../core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../../../core/themes/app_colors.dart';
import '../../utils/assinatura_utils/assinatura_widget_util.dart';
import '../bloc/listar_alunos_bloc.dart';
import '../bloc/listar_alunos_event.dart';

class ListarAlunosPage extends StatefulWidget {
  final ListarTurmasEntity turma;
  final String acao;
  final String idProfessor;
  final String nomeProfessor;
  final String emailhospital;
  final String? justificativa;

  const ListarAlunosPage(
      {Key? key,
      required this.turma,
      required this.acao,
      required this.idProfessor,
      required this.emailhospital,
      required this.nomeProfessor,
      this.justificativa})
      : super(key: key);

  @override
  State<ListarAlunosPage> createState() => _ListarAlunosPageState();
}

class _ListarAlunosPageState extends State<ListarAlunosPage> {
  @override
  Widget build(BuildContext context) {

    final ListarAlunosBloc bloc = Modular.get<ListarAlunosBloc>();
    bloc.add(CarregandoEvent(idTurma: widget.turma.id));
    return EsqueletoPaginasApp(
        ativarBotaoFlutuante: true,
        botao: button(context),
        child: _buildPage(context));
  }

  late List<ListarAlunosEntity> alunos;

  Widget _buildPage(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return BlocBuilder<ListarAlunosBloc, ListarAlunosState>(
      bloc: Modular.get<ListarAlunosBloc>(),
      builder: (context, state) {
        final ListarAlunosBloc bloc = Modular.get<ListarAlunosBloc>();

        if (state is ErrorState) {
          return ErrorTextWidget(
            message: "${state.message} ${widget.turma.nome}",
          );
        }

        if (state is ScaffoldErrorState) {
          Future.delayed(Duration.zero, () {
            SnackBar snackBar = SnackBar(
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
        if (state is CarregadoState) {
          alunos = state.alunos;
          return SafeArea(
            child: SizedBox(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "${state.alunos.length} Alunos da Turma: ${widget.turma.nome}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.04),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.80,
                    child: ListView.separated(
                      itemCount: state.alunos.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            bloc.add(EnviandoEvent(state.alunos[index],
                                widget.turma.id, widget.acao, state.alunos));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.blue, width: 3)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nome: ${state.alunos[index].nome}",
                                  style: TextStyle(fontSize: size.width * 0.04),
                                ),
                                if (bloc.alunosAssinado
                                    .where((element) =>
                                        element["idAluno"] ==
                                        state.alunos[index].id)
                                    .isEmpty)
                                  const Text(
                                    "Status: Não Assinado",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                if (bloc.alunosAssinado
                                    .where((element) =>
                                        element["idAluno"] ==
                                        state.alunos[index].id)
                                    .isNotEmpty)
                                  const Text(
                                    "Status: Assinado",
                                    style: TextStyle(color: Colors.green),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  FloatingActionButton button(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.blue,
      child: const Icon(
        Icons.check,
        color: AppColors.orange,
      ),
      onPressed: () {
        customPopup(context);
      },
    );
  }
  customPopup(
    BuildContext context,
  ) {
    final SignatureController controller = SignatureController(
      penStrokeWidth: 2,
      penColor: AppColors.pen,
      exportBackgroundColor: Colors.transparent,
    );

    final size = MediaQuery.of(context).size;
    final ListarAlunosBloc bloc = Modular.get<ListarAlunosBloc>();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
            'Total de alunos: ${alunos.length}  | Sem Assinar: ${alunos.length - bloc.alunosAssinado.length} Deseja continuar?'),
        content: SizedBox(
          width: size.width * 0.9,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text("Sua Assinatura"),
              ),
              SizedBox(child: AssinaturaWidgetUtils(controller: controller)),
            ],
          ),
        ),

        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancelar'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              if (controller.isNotEmpty) {
                String assinatura = "";
                await controller.toPngBytes().then(
                    (value) => assinatura = base64Encode(value!).toString());
                bloc.add(EnviarAssinaturaProfessorEvent(
                    professorId: widget.idProfessor,
                    assinaturaProfessor: assinatura,
                    turma: widget.turma,
                    nomeProfessor: widget.nomeProfessor,
                    justificativa: widget.justificativa,
                    acao: widget.acao, emailHospital: widget.emailhospital
                ));

              }  else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                   const AlertDialog(
                    title: Text("Aviso !"),
                    content: Text("Assine antes de salvar"),
                  ),
                );
                Future.delayed(const Duration(seconds:2),() => Modular.to.pop());

              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
