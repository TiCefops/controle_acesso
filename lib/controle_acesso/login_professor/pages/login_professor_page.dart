import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../../../core/themes/app_colors.dart';
import '../blocs/state.dart';
import '../blocs/bloc.dart';
import '../blocs/event.dart';

class LoginProfessorPage extends StatelessWidget {
  const LoginProfessorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<LoginProfessorBloc>();
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider<LoginProfessorBloc>(
          create: (BuildContext context) => bloc..add(InitEvent()),
          child: Builder(builder: (context) => _buildPage(context))),
    );
  }
}

Widget _buildPage(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final cpfController = TextEditingController();
  return BlocBuilder<LoginProfessorBloc, LoginProfessorBlocState>(
    bloc: BlocProvider.of<LoginProfessorBloc>(context),
    builder: (context, state) {
      LoginProfessorBloc bloc = BlocProvider.of<LoginProfessorBloc>(context);
      if (state is LoginProfessorBlocErrorState) {
        Future.delayed(Duration.zero, () {
          SnackBar snackBar = SnackBar(
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }

      return SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: size.width * 0.2,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                "Login Professor",
                style: TextStyle(
                    fontSize: size.width * 0.03, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Text(
                "CPF",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: size.width * 0.03),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              SizedBox(
                width: size.width * 0.6,
                child: TextFormField(
                  controller: cpfController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: AppColors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: AppColors.orange),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              state is LoginProfessorBlocLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.blue)),
                        onPressed: () async {
                          bloc.add(
                              LoginProfessorFetchData(cpf: cpfController.text));
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}
