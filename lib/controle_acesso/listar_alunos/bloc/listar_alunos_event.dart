import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/adicionar_assinatura_professor_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_alunos_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/login_professor_entity.dart';
import 'package:equatable/equatable.dart';

import '../../listar_turmas/data/interface/model/i_listar_turmas_entity.dart';

abstract class ListarAlunosEvent extends Equatable {
  const ListarAlunosEvent();

  @override
  List<Object> get props {
    return [];
  }
}
class InitEvent extends ListarAlunosEvent {}

class CarregandoEvent extends ListarAlunosEvent {
  final String idTurma;

  const CarregandoEvent({required this.idTurma});
}

class ErroEvent extends ListarAlunosEvent {
  final String menssage;

  const ErroEvent(this.menssage);
  @override
  List<Object> get props {
    return [menssage];
  }
}
class ErroSnacBarEvent extends ListarAlunosEvent {
  final String menssage;

  const ErroSnacBarEvent(this.menssage);
  @override
  List<Object> get props {
    return [menssage];
  }
}

class CarregadoEvent extends ListarAlunosEvent {}

class EnviandoEvent extends ListarAlunosEvent {
  final ListarAlunosEntity aluno;
  final List <ListarAlunosEntity> alunos;
  final String turma;
  final String status;

  const EnviandoEvent(this.aluno, this.turma, this.status, this.alunos);
}

class AdicionarAssinaturaNaListaEvent extends ListarAlunosEvent {
  final String alunoId;

  const AdicionarAssinaturaNaListaEvent({required this.alunoId});
}


class EnviarAssinaturaProfessorEvent extends ListarAlunosEvent {
  final String professorId;
  final String nomeProfessor;
  final ListarTurmasEntity turma;
  final String assinaturaProfessor;
  final String acao;
  final String emailHospital;
  final String? justificativa;

  const EnviarAssinaturaProfessorEvent(      {required this.emailHospital,this.justificativa,required this.acao,required this.professorId,required this.assinaturaProfessor,required this.turma,required this.nomeProfessor,});
}



