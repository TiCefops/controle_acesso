import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../themes/app_colors.dart';
import '../bloc/cadastro_app_bloc.dart';
import '../bloc/cadastro_app_event.dart';
import '../bloc/cadastro_app_state.dart';

class Cadastro_appPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  bloc=Modular.get<CadastroAppBloc>();

    return BlocProvider(
      create: (BuildContext context) => bloc..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CadastroAppBloc>(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final TextEditingController hospitalController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final size = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cadastro de usuário',
                style: TextStyle(
                    fontSize: size.width * 0.03, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blue, width: 3)),
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                controller: senhaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blue, width: 3)),
                  hintText: 'Senha',
                ),
              ),
              TextFormField(
                controller: hospitalController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blue, width: 3)),
                  hintText: 'Nome do Hospital',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
