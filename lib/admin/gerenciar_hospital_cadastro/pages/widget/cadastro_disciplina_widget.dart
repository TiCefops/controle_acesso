
import 'package:cefops_controll_acess/admin/gerenciar_hospital/pages/widget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../../core/themes/app_colors.dart';
import '../../bloc/criar_cadastro_hospital_bloc.dart';
import '../../bloc/criar_cadastro_hospital_event.dart';
import '../../bloc/criar_cadastro_hospital_state.dart';

class CadastroDisciplinaWidget extends StatelessWidget {
  const CadastroDisciplinaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Modular.get<CriarCadastroHospitalBloc>();
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController maxAlunoController = TextEditingController();

    return BlocBuilder<CriarCadastroHospitalBloc, CriarCadastroHospitalState>(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return Container(
              decoration: BoxDecoration(
              border: Border(
              top: BorderSide(width: size.width*0.01, color: AppColors.orange),
          bottom: BorderSide(
          width: size.width*0.01, color: Colors.lightBlue.shade900),
          ),),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.12),
                Text('Disciplinas', style: TextStyle(fontSize: size.width*0.035, fontWeight: FontWeight.bold,),),
                SizedBox(height: size.height * 0.2),
                SizedBox(
                  width: size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Disciplina: '),
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
                          items: [
                            "India",
                            "USA",
                            "Brazil",
                            "Canada",
                            "Australia",
                            "Singapore"
                          ],
                          onChanged: print,
                          //show selected item
                          selectedItem: "India",
                        ),
                      ),
                      const Text('Alunos: '),
                      SizedBox(
                        width: size.width * 0.1,
                        child: TextFormWidget(
                          controller: nomeController,
                          hintText: 'Max De Alunos',
                          keyBoardTayp: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Andar: '),
                    SizedBox(
                      width: size.height * 0.1,
                      child: DropdownButton<String>(
                        //value: ,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {},
                        items: <String>['1', '2', '3', '4', '5', '6']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                    ),
                    SizedBox(
                width: size.width * 0.15,
                      height: size.height * 0.13,
                      child: ListView.builder(
                        itemCount: turmas.length,
                        itemBuilder: (BuildContext context, int i) {
                          if (state is CriarHospitalState) {
                            return ListTile(
                              title: Text(
                                turmas[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: i == 5
                                            ? Colors.black38
                                            : Colors.black),
                              ),
                              leading: Radio(
                                value: i,
                                groupValue: state.click,
                                activeColor: const Color(0xFF6200EE),
                                onChanged: (int? value) {
                                  bloc.add(InitEventCadastroHospitalEvent(
                                      click: value!));
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.blue),
                        onPressed: () =>
                            bloc.add(InitEventCadastroHospitalEvent(click: 0)),
                        child: Text("Voltar")),
                    SizedBox(width: size.width*0.17,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: AppColors.blue),
                        onPressed: () => bloc.add(CriarCadastroProfessorEvent()),
                        child: Text("Avançar")),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

List<String> turmas = ['278', '279', '280'];

class DropdownItem extends StatefulWidget {
  const DropdownItem({Key? key}) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
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
      items: dropdownItems,
      onChanged: (String? value) {},
    );
  }
}
