

import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import 'package:equatable/equatable.dart';

import '../data/model/listar_turmas_model.dart';

class ListarTurmasState extends Equatable{
  ListarTurmasState init() {
    return ListarTurmasState();
  }

  ListarTurmasState clone() {
    return ListarTurmasState();
  }

  @override
  List<Object> get props {
    return [];
  }
}
class CarregandoState extends ListarTurmasState{
}

class ErrorState extends ListarTurmasState{
  final String message;

  ErrorState({required this.message});
}

class CarregadoState extends ListarTurmasState{
  final List<ListarTurmasEntity> turmas;

   CarregadoState({required this.turmas});
}

