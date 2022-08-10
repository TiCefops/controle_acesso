import 'package:cefops_controll_acess/core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import 'package:cefops_controll_acess/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../listar_turmas/data/interface/model/i_listar_turmas_entity.dart';

class AcaoPage extends StatelessWidget {
  const AcaoPage(
      {Key? key,
      required this.turma,
      required this.idProfessor,
      required this.emailHospital,
      required this.nomeProfessor})
      : super(key: key);
  final ListarTurmasEntity turma;
  final String idProfessor;
  final String nomeProfessor;
  final String emailHospital;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataFormatada = DateTime.now().toString().substring(0, 10);
    final now = DateTime.now();

    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: size.height * 0.04),
          Expanded(
            flex: 1,
            child: Text(
              "Ação para turma: ${turma.nome} ",
              style: TextStyle(
                  fontSize: size.width * 0.03, fontWeight: FontWeight.w900),
            ),
          ),
          Text("Disciplina: ${turma.disciplina}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Data Inicio: ${turma.dataInicio}"),
              Text("Data Fim: ${turma.dataFim}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hora Entrada: ${turma.horaEntrada}"),
              Text("Hora Saída: ${turma.horaSaida}"),
            ],
          ),
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.blue)),
                  onPressed: () async {
                    if (now.isAfter(DateTime.parse(
                        "$dataFormatada ${turma.horaEntrada}"))) {
                      _showMyDialog(context, 'Atraso Detectado', "1");
                    } else {
                      Modular.to.pushNamed(
                          './listar_alunos?acao=1&idProfessor=$idProfessor&nomeProfessor=$nomeProfessor&justificativa=Nd&emailHospital=$emailHospital',
                          arguments: turma);
                    }
                  },
                  child: const Text(
                    "Entrada",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(100, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.blue)),
                  onPressed: () async {
                    if (now.isBefore(
                        DateTime.parse("$dataFormatada ${turma.horaSaida}"))) {
                      _showMyDialog(context, 'Saindo antes do Horário', "2");
                      await Future.delayed(const Duration(seconds: 3), () {});
                    } else {
                      Modular.to.pushNamed(
                          './listar_alunos?acao=2&idProfessor=$idProfessor&nomeProfessor=$nomeProfessor&justificativa=Nd&emailHospital=$emailHospital',
                          arguments: turma);
                    }
                  },
                  child: const Text(
                    "Saída",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(
      BuildContext context, String text, String acao) async {
    TextEditingController justificativa = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text(
              'Aviso',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04),
            ),
            content: SizedBox(
              width: size.width * 0.8,
              child: ListBody(
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.03),
                  ),
                  const Text("Justifique"),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: justificativa,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mark_unread_chat_alt_outlined),
                        hintText: 'O Carro Quebrou... ',
                        labelText: 'Justificativa',
                      ),
                      validator: (String? value) {
                        if (value!.isNotEmpty) {
                          if (value.length < 20) {
                            return "A justificativa Deve Conter no Minino 20  Caracteres ";
                          }
                          return null;
                        }
                        return "Justifique !";
                      },
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Modular.to.pop();
                    Modular.to.pushNamed(
                        './listar_alunos?acao=$acao&idProfessor=$idProfessor&nomeProfessor=$nomeProfessor&justificativa=${justificativa.text}&emailHospital=$emailHospital',
                        arguments: turma);
                  }
                },
                child: const Text("Confirmar"),
              )
            ],
          ),
        );
      },
    );
  }
}
