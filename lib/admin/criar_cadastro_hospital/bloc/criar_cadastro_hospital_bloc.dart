import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/interface/services/i_criar_cadastro_hospital_services.dart';
import 'criar_cadastro_hospital_event.dart';
import 'criar_cadastro_hospital_state.dart';

class CriarCadastroHospitalBloc extends Bloc<CriarCadastroHospitalEvent, CriarCadastroHospitalState> {
  final ICriarCadastroHospitalServices service;

  CriarCadastroHospitalBloc(this.service) : super(CriarCadastroHospitalState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<CriarCadastroHospitalState> emit) async {
    emit(state.clone());
  }
  // Future<void> _cadastroHospitalEvent(CadastroHospitalConcluidoEvent event, Emitter<CadastroHospitalAppState> emit) async {
  //   Map<String, dynamic>modelo = {
  //     // "email": event.email,
  //     // "password": event.password,
  //   };
  // }

}
