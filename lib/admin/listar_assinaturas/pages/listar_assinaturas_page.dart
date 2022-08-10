import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/listar_assinaturas_bloc.dart';
import '../bloc/listar_assinaturas_event.dart';
import '../bloc/listar_assinaturas_state.dart';

class ListarAssinaturasPage extends StatelessWidget {
  final ListarAssinaturasBloc bloc = Modular.get<ListarAssinaturasBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc..add(CarregadoEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final bloc = Modular.get<ListarAssinaturasBloc>();
    return BlocBuilder<ListarAssinaturasBloc, ListarAssinaturasState>(
        bloc: BlocProvider.of<ListarAssinaturasBloc>(context),
        builder: (context, state) {
          if (state is CarregadoState) {
            return SafeArea(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      height: size.height * 0.85,
                      child: ListView.separated(
                        itemCount: state.dados.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              children: [
                              Image(image:   MemoryImage(base64Decode(state.dados[index].assinatura), scale: 2)),
                                Text("Horário: ${state.dados[index]
                                    .horaAssinatura}",
                                  style:
                                  TextStyle(fontSize: size.width * 0.04),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                            height: 10),

                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
    );
  }
}
