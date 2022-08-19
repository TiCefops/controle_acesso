import 'package:cefops_controll_acess/admin/criar_cadastro_hospital/bloc/criar_cadastro_hospital_event.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/themes/app_colors.dart';
import '../../bloc/criar_cadastro_hospital_bloc.dart';

class CadastroProfessorWidget extends StatelessWidget {
  const CadastroProfessorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<CriarCadastroHospitalBloc>();
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: size.width * 0.01, color: AppColors.orange),
          bottom: BorderSide(
              width: size.width * 0.01, color: Colors.lightBlue.shade900),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.12),
          Text(
            'Professores',
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.2),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Professor(a): "),
                    SizedBox(
                      width: size.width * 0.3,
                      child: DropdownSearch<String>(
                        //mode of dropdown
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        //list of dropdown items
                        enabled: true,
                        items:  [
                          "Joao",
                          "Julia",
                          "Kleber",
                          "Kiriku",
                          "Flinstons",
                          "Neymar"
                        ],
                        onChanged: print,
                        //show selected item
                        selectedItem: "Selecione: ",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Text('Turno: ', style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    const Text('Manhã')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    const Text('Tarde')
                  ],
                ),
                    Row(
                      children: [
                        Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                        const Text('Noite')
                      ],
                    ),
            ],
          ),
                SizedBox(height: size.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: AppColors.blue),
                        onPressed: () =>
                            bloc.add(CriarCadastroDisciplinasEvent()),
                        child: Text("Voltar")),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: AppColors.blue),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: const Text('AlertDialog description'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                    // bloc.add(ConcluirCadastiEvent()),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Text("Concluir")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
