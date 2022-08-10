import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/interface/entity/assinatura_aluno_enity.dart';
import 'package:equatable/equatable.dart';

abstract class AssinaturaAlunoEvent extends Equatable {
  const AssinaturaAlunoEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends AssinaturaAlunoEvent {}

class LoadEvent extends AssinaturaAlunoEvent {}

class SendEvent extends AssinaturaAlunoEvent {
  final AssinaturaAlunoEntity assinatura;


  const SendEvent(
      {required this.assinatura});
}
