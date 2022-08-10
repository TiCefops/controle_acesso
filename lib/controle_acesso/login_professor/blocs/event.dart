import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../data/model/login_professor_model_impl.dart';

abstract class LoginProfessorBlocEvent extends Equatable {
  const LoginProfessorBlocEvent();
  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends LoginProfessorBlocEvent {}

class LoginProfessorFetchData extends LoginProfessorBlocEvent {
  final String cpf;

  const LoginProfessorFetchData({required this.cpf});
}

class LoginProfessorFetchDataError extends LoginProfessorBlocEvent {
  final String message;

  const LoginProfessorFetchDataError(this.message);
}

class LoginProfessorFetchDataLoading extends LoginProfessorBlocEvent {


}

