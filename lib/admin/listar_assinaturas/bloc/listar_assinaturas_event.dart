import 'package:equatable/equatable.dart';

abstract class ListarAssinaturasEvent extends Equatable {
  const ListarAssinaturasEvent();
  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends ListarAssinaturasEvent {}

class CarregadoEvent extends ListarAssinaturasEvent {}