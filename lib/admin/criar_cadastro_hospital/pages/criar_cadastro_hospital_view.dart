import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/esqueleto_paginas_app/esqueleto_paginas_app.dart';
import '../../../core/themes/app_colors.dart';
import '../bloc/criar_cadastro_hospital_bloc.dart';
import '../bloc/criar_cadastro_hospital_event.dart';
import '../bloc/criar_cadastro_hospital_state.dart';

class CriarCadastroHospitalPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<CriarCadastroHospitalBloc>();

    return EsqueletoPaginasApp(
      ativarBotaoFlutuante: false,
      child: BlocProvider(
        create: (BuildContext context) => bloc..add(InitEvent()),
        child: Builder(builder: (context) => _buildPage(context)),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<CriarCadastroHospitalBloc>(context);
    final size = MediaQuery.of(context).size;
    final TextEditingController nomehospitalController =
        TextEditingController();
    final TextEditingController disciplinaController = TextEditingController();
    final TextEditingController andarController = TextEditingController();
    final TextEditingController maxalunoController = TextEditingController();
    final TextEditingController turmasController = TextEditingController();

    final GlobalKey<FormState> formKeyHospital = GlobalKey<FormState>();

    return Container(
      child: SizedBox(
        child: Form(
          key: formKeyHospital,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cadastro de Hospitais',
                style: TextStyle(
                    fontSize: size.width * 0.03, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: Text("Hospital: "),
                  ),
                  SizedBox(
                    width: size.width*0.2,
                    child: TextFormField(
                      controller: nomehospitalController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.blue,
                          width: 3,
                        )),
                        hintText: 'Nome do Hospital',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: Text("Alunos: "),
                  ),
                  SizedBox(
                    width: size.width*0.2,
                    child: TextFormField(
                      controller: maxalunoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.blue,
                          width: 3,
                        )),
                        hintText: 'Maxímo de Alunos',
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItem extends StatefulWidget {
  const DropdownItem({Key? key}) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems =const [
      DropdownMenuItem(value: "USA", child: Text("USA")),
      DropdownMenuItem(value: "Canada", child: Text("Canada")),
      DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }
  String selectedValue = "USA";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: dropdownItems, onChanged: (String? value) {  },
    );
  }
}


