import 'dart:convert';

import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/model/assinatura_aluno_model.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_alunos_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/utils/assinatura_utils/assinatura_widget_util.dart';
import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:cefops_controll_acess/core/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';

class AssinaturaAlunoPage extends StatelessWidget {
  const AssinaturaAlunoPage(
      {Key? key,
      required this.aluno,
      required this.turma,

      required this.status})
      : super(key: key);
  final ListarAlunosEntity aluno;
  final String turma;
  final String status;

  @override
  Widget build(BuildContext context) {
    final AssinaturaAlunoBloc bloc = Modular.get<AssinaturaAlunoBloc>();
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) => bloc..add(InitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SignatureController controller = SignatureController(
      penStrokeWidth: 2,
      penColor: AppColors.pen,
      exportBackgroundColor: Colors.transparent,
    );

    return SafeArea(
      child: Column(
        children: [
          Text(
            "Assinatura",
            style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColors.blue,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Nome: ${aluno.nome}",
            style: TextStyle(fontSize: size.width * 0.03),
          ),
          Text(
            "CPF: ${aluno.cpf}",
            style: TextStyle(fontSize: size.width * 0.03),
          ),
          Text("Sua Assinatura:",
              style: TextStyle(
                  fontSize: size.width * 0.025, color: AppColors.blue)),
          SizedBox(height: size.height * 0.04),
          AssinaturaWidgetUtils(controller: controller),
          SizedBox(height: size.height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  controller.clear();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.blue)),
                child: const Text(
                  "Limpar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () async {
                  customPopup(context, controller);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.blue)),
                child: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),
        ],
      ),
    );

  }
  customPopup(BuildContext context,SignatureController controller){
    final now = DateTime.now();
    final data = DateFormat("dd-MM-yyyy HH:mm").format(now);
    final hora = DateFormat("HH:mm").format(now);

    final size = MediaQuery.of(context).size;
    final AssinaturaAlunoBloc bloc = Modular.get<AssinaturaAlunoBloc>();

    return  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Deseja continuar?'),
        content: RichText(
          text: TextSpan(
            text: 'Confirme se as informações estão corretas:',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: '\nHora Assinatura: $hora',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.035)),
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
              String assinatura = "";
              if (controller.isNotEmpty) {
                await controller.toPngBytes().then((value) =>
                assinatura = base64Encode(value!).toString());
                Map<String, dynamic> dados = {
                  "alunoId": aluno.id,
                  "hospitalId": FirebaseAuth.instance.currentUser!.uid,
                  "hospitalNome":FirebaseAuth.instance.currentUser!.displayName,
                  "horaAssinatura": data,
                  "tipoEntrada": status,
                  "assinaturaAluno": assinatura,
                  "nomeAluno":aluno.nome,
                  "cpf":aluno.cpf,


                };
                AssinaturaAlunoModel dadosAssinatura =
                AssinaturaAlunoModel.fromJson(dados);

                bloc.add(SendEvent(assinatura: dadosAssinatura));

                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                  const AlertDialog(
                    title: Text("OK!"),
                    content:
                    Text("Assinatura salva com sucesso!"),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                  const AlertDialog(
                    title: Text("Erro!"),
                    content: Text("Assine antes de salvar"),
                  ),
                );
                Future.delayed(const Duration(seconds: 1),()=> Modular.to.pop());
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
