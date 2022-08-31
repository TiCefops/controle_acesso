import 'package:equatable/equatable.dart';

abstract class CriarCadastroHospitalEvent extends Equatable {
  const CriarCadastroHospitalEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends CriarCadastroHospitalEvent {}

class InitEventCadastroHospitalEvent extends CriarCadastroHospitalEvent {
  final int click;

  const InitEventCadastroHospitalEvent({required this.click});

  @override
  List<Object> get props {
    return [click];
  }
}

class EnviarCadastoHospitalEvent extends CriarCadastroHospitalEvent {
  final String email;
  final String password;
  final String nome;

  const EnviarCadastoHospitalEvent(
      {required this.email, required this.password, required this.nome});

  @override
  List<Object> get props {
    return [email, password, nome];
  }
}

class CadastroConcluidoEvent extends CriarCadastroHospitalEvent {
  final String nomeHospital;
  final String disciplina;
  final String andar;
  final String maxAluno;
  final String turmas;

  const CadastroConcluidoEvent(
      {required this.nomeHospital,
      required this.disciplina,
      required this.andar,
      required this.maxAluno,
      required this.turmas});

  @override
  List<Object> get props {
    return [nomeHospital, disciplina, andar, maxAluno, turmas];
  }
}

class CriarCadastroDisciplinasEvent extends CriarCadastroHospitalEvent {
  const CriarCadastroDisciplinasEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class CriarCadastroDisciplinasAdicionarEvent
    extends CriarCadastroHospitalEvent {
  @override
  List<Object> get props {
    return [];
  }
}

class CriarCadastroProfessorEvent extends CriarCadastroHospitalEvent {
  CriarCadastroProfessorEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class ClickRadioButtonEvent extends CriarCadastroHospitalEvent {
  final int click;

  const ClickRadioButtonEvent({required this.click});

  @override
  List<Object> get props {
    return [click];
  }
}

class ConcluirCadastiEvent extends CriarCadastroHospitalEvent {
  @override
  List<Object> get props {
    return [];
  }
}
