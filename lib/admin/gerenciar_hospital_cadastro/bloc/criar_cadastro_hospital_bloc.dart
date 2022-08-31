import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/interface/services/i_criar_cadastro_hospital_services.dart';
import 'criar_cadastro_hospital_event.dart';
import 'criar_cadastro_hospital_state.dart';

class CriarCadastroHospitalBloc
    extends Bloc<CriarCadastroHospitalEvent, CriarCadastroHospitalState> {
  final ICriarCadastroHospitalServices service;

  CriarCadastroHospitalBloc(this.service)
      : super(CriarCadastroHospitalState().init()) {
    on<InitEvent>(_init);
    on<InitEventCadastroHospitalEvent>(_cadastroHospital);
    on<EnviarCadastoHospitalEvent>(_cadastrarHospitalFirebase);
    on<CriarCadastroDisciplinasEvent>(_cadastroDisciplina);
    on<CriarCadastroProfessorEvent>(_cadastroProfessor);
    on<ConcluirCadastiEvent>(_cadastrarHospital);
    on<ClickRadioButtonEvent>(_radioButtonClicado);
  }

  void _init(InitEvent event, Emitter<CriarCadastroHospitalState> emit) async {
    emit(state.clone());
    add(const InitEventCadastroHospitalEvent(click: 0));
  }

  Future<void> _cadastroHospital(InitEventCadastroHospitalEvent event,
      Emitter<CriarCadastroHospitalState> emit) async {
    emit(CriarHospitalState(event.click));
  }

  Future<void> _cadastroDisciplina(CriarCadastroDisciplinasEvent event,
      Emitter<CriarCadastroHospitalState> emit) async {
    emit(CriarDisciplinaState());
  }

  Future<void> _cadastroProfessor(CriarCadastroProfessorEvent event,
      Emitter<CriarCadastroHospitalState> emit) async {
    emit(CriarProfessorState());
  }

  Future<void> _cadastrarHospital(ConcluirCadastiEvent event,
      Emitter<CriarCadastroHospitalState> emit) async {}

  FutureOr<void> _radioButtonClicado(
      ClickRadioButtonEvent event, Emitter<CriarCadastroHospitalState> emit) {
    emit(ClickRadioButtonState());
  }

  List<String> andares = ['1', '2', '3', '4', '5', '6', '7'];

  Future<void> _cadastrarHospitalFirebase(EnviarCadastoHospitalEvent event,
      Emitter<CriarCadastroHospitalState> emit) async {
    // await service.criarCadastroHospital(
    //     email: event.email, password: event.password, nome: event.nome);
    emit(ConcluirCadastroState());

  }
}
