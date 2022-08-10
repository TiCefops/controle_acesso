import 'package:cefops_controll_acess/core/cadastro_app/bloc/cadastro_app_state.dart';
import 'package:equatable/equatable.dart';

abstract class CadastroAppEvent extends Equatable {
  const CadastroAppEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends CadastroAppEvent {}


class CadastroConcluidoEvent extends CadastroAppEvent{
  final String email;
  final String password;
  final String nomeHospital;

   const CadastroConcluidoEvent({required this.email, required this.password,required this.nomeHospital});
}

class ErrorEvent extends CadastroAppEvent{

}
