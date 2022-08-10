import 'package:equatable/equatable.dart';

import '../data/interfaces/entity/listar_alunos_entity.dart';
import '../data/interfaces/entity/listar_disciplinas_entity.dart';

class ListarAlunosState extends Equatable {
  ListarAlunosState init() {
    return ListarAlunosState();
  }

  ListarAlunosState clone() {
    return ListarAlunosState();
  }
  @override
  List<Object> get props {
    return [];
  }
}
class CarregandoState extends ListarAlunosState{}

class ErrorState extends ListarAlunosState{
  final String message;

  ErrorState({required this.message});
}

class ScaffoldErrorState extends ListarAlunosState{
  final String message;
  @override
  List<Object> get props {
    return [message];
  }
  ScaffoldErrorState({required this.message});
}
class AssinadoState extends ListarAlunosState{

}
class CarregadoState extends ListarAlunosState{
  final List<ListarAlunosEntity> alunos;
  CarregadoState({required this.alunos});
}
