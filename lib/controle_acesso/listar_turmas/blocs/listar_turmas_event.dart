import 'package:equatable/equatable.dart';

abstract class ListarTurmasEvent extends Equatable {
  const ListarTurmasEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends ListarTurmasEvent {}

class CarregandoEvent extends ListarTurmasEvent {
  final String idProfessor;

  const CarregandoEvent({required this.idProfessor});
}

class ErroEvent extends ListarTurmasEvent {}

class CarregadoEvent extends ListarTurmasEvent {}
