
import 'package:cefops_controll_acess/admin/gerenciar_hospital/pages/widget/cadastro_disciplina_widget.dart';
import 'package:cefops_controll_acess/admin/gerenciar_hospital/pages/widget/cadastro_professor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../../../core/themes/app_colors.dart';
import '../../gerenciar_hospital/pages/widget/text_form_widget.dart';
import '../bloc/criar_cadastro_hospital_bloc.dart';
import '../bloc/criar_cadastro_hospital_event.dart';
import '../bloc/criar_cadastro_hospital_state.dart';

class CriarCadastroHospitalPage extends StatelessWidget {
  const CriarCadastroHospitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<CriarCadastroHospitalBloc>();

    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) =>
            bloc..add(const InitEventCadastroHospitalEvent(click: 0)),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CriarCadastroHospitalBloc>(context);
    final size = MediaQuery.of(context).size;
    final TextEditingController nomehospitalController =
        TextEditingController();
    final TextEditingController emailhospitalController =
        TextEditingController();
    final TextEditingController sehaController = TextEditingController();

    final GlobalKey<FormState> formKeyHospital = GlobalKey<FormState>();

    return BlocBuilder<CriarCadastroHospitalBloc, CriarCadastroHospitalState>(
        bloc: Modular.get<CriarCadastroHospitalBloc>(),
        builder: (context, state) {
          if (state is CriarDisciplinaState) {
            return const CadastroDisciplinaWidget();
          }
          if (state is CriarProfessorState) {
            return const CadastroProfessorWidget();
          }  
          if (state is ConcluirCadastroState) {
            Future.delayed(Duration.zero,()=>   showDialogMessage(context));

          }
          
          return SizedBox(
            width: size.width * 0.2,
            child: Form(
              key: formKeyHospital,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: size.width * 0.01, color: AppColors.orange),
                    bottom: BorderSide(
                        width: size.width * 0.01,
                        color: Colors.lightBlue.shade900),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Text(
                      'Hospital',
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Hospital:   "),
                          SizedBox(
                              width: size.width * 0.42,
                              child: TextFormWidget(
                                controller: nomehospitalController,
                                hintText: 'Nome Hospital',
                                keyBoardTayp: TextInputType.name,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    SizedBox(
                      width: size.width * 0.46,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("E-mail:     "),
                          SizedBox(
                              width: size.width * 0.2,
                              child: TextFormWidget(
                                controller: emailhospitalController,
                                hintText: 'E-mail Hospital',
                                keyBoardTayp: TextInputType.emailAddress,
                              )),
                          SizedBox(width: size.width * 0.04),
                          const Text("Senha: "),
                          Expanded(
                            child: SizedBox(
                                width: size.width * 0.4,
                                child: TextFormWidget(
                                  keyBoardTayp: TextInputType.number,
                                  controller: sehaController,
                                  hintText: 'Senha',
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: size.width * 0.2,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.blue),
                            onPressed: ()  => bloc.add(
                                EnviarCadastoHospitalEvent(
                                    nome: nomehospitalController.text,
                                    email: emailhospitalController.text,
                                    password: sehaController.text)),
                            child: const Text("OK")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  
  
  void showDialogMessage(BuildContext context){
    final bloc = Modular.get<CriarCadastroHospitalBloc>();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Cadastro Concluído'),
        content: const Text('Deseja prosseguir com o Cadastro \n de disciplinas?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('NÃO', style: TextStyle(color: AppColors.orange),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(const CriarCadastroDisciplinasEvent());
            },
            
            child: const Text('SIM', style: TextStyle(color: AppColors.orange),),
          ),
        ],
      ),
    );
  }
}
