import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/login_professor_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/model/login_professor_model_impl.dart';
import 'package:equatable/equatable.dart';

class LoginProfessorBlocState extends Equatable {
  LoginProfessorBlocState init() {
    return LoginProfessorBlocState();
  }

  LoginProfessorBlocState clone() {
    return LoginProfessorBlocState();
  }

  @override
  @override
  List<Object> get props {
    return [];
  }
}

class LoginProfessorBlocLoadingState extends LoginProfessorBlocState {
}

class LoginProfessorBlocErrorState extends LoginProfessorBlocState {
  final String message;

  LoginProfessorBlocErrorState({required this.message});
}

class LoginProfessorBlocSuccessState extends LoginProfessorBlocState {
  final LoginProfessorEntity professor;

  LoginProfessorBlocSuccessState({required this.professor});
}
