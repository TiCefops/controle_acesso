import 'package:cefops_controll_acess/core/login_app/bloc/login_app_state.dart';
import 'package:cefops_controll_acess/core/login_app/pages/widgets/login_app_form_widget.dart';
import 'package:cefops_controll_acess/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../bloc/login_app_bloc.dart';
import '../bloc/login_app_event.dart';

class LoginAppPage extends StatelessWidget {
  const LoginAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) => LoginAppBloc()..add(InitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<LoginAppBloc, LoginAppState>(
        bloc: BlocProvider.of<LoginAppBloc>(context),
        builder: (context, state) {
          final emailController = TextEditingController();
          final senhaController = TextEditingController();
          final GlobalKey<FormState> key = GlobalKey();

          final bloc = context.read<LoginAppBloc>();
          final size = MediaQuery.of(context).size;

          if (state is ErrorState) {
            Future.delayed(Duration.zero,(){
              SnackBar snackBar = SnackBar(
                content: Text(state.message),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: size.width * 0.2,
                  ),
                ),
                Text(
                  "Iniciar Sistema",
                  style: TextStyle(
                      fontSize: size.width * 0.03, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        LoginAppFormWidget(controller: emailController, hintText: 'E-mail',),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        LoginAppFormWidget(controller: senhaController, hintText: 'Senha',),
                      ],
                    ),
                  ),
                ),
                state is LoginSubmittedState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextButton(
                            onPressed: ()async {

                              final status = await Permission.storage.request();
                              if (status.isDenied) {
                                Permission.storage;
                              }

                              if(key.currentState!.validate()){
                                bloc.add(LoginSubmittedEvent(
                                    email: emailController.text,
                                    password: senhaController.text));
                              }
                            } ,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.blue)),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white, fontSize: size.width * 0.015),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );

        });
  }
}
