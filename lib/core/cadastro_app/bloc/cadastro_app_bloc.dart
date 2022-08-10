import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cefops_controll_acess/core/cadastro_app/data/model/cadastro_app_model.dart';
import 'package:cefops_controll_acess/core/login_app/services/login_app_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/interface/services/i_cadastro_app_services.dart';
import 'cadastro_app_event.dart';
import 'cadastro_app_state.dart';

class CadastroAppBloc extends Bloc<CadastroAppEvent, CadastroAppState> {
  final ICadastroAppServices service;

  CadastroAppBloc({required this.service}) : super(CadastroAppState().init()) {
    on<InitEvent>(_init);
    on<CadastroConcluidoEvent>(_cadastroEvent);
  }

  void _init(InitEvent event, Emitter<CadastroAppState> emit) async {
    emit(state.clone());
  }

  Future<void> _cadastroEvent(CadastroConcluidoEvent event, Emitter<CadastroAppState> emit) async {
    Map<String, dynamic>modelo = {
      "email": event.email,
      "password": event.password,
      "nomeHospital": event.nomeHospital,
    };
    final dados = CadastroAppModel.fromJson(modelo);
    await service.cadastrar(dados);
  }
}
