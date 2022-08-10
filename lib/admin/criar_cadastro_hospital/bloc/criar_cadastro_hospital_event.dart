import 'package:equatable/equatable.dart';

abstract class CriarCadastroHospitalEvent extends Equatable {
  const CriarCadastroHospitalEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends CriarCadastroHospitalEvent {}

class CadastroConcluidoEvent extends CriarCadastroHospitalEvent {
  final String nomeHospital;
  final String disciplina;
  final String andar;
  final String maxAluno;
  final String turmas;

  CadastroConcluidoEvent(
      {required this.nomeHospital,
      required this.disciplina,
      required this.andar,
      required this.maxAluno,
      required this.turmas});
}
