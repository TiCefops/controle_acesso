import 'package:equatable/equatable.dart';

abstract class AssinaturaProfessorEvent extends Equatable {
  const AssinaturaProfessorEvent();
  @override
  List<Object> get props {
    return [];
  }}

class InitEvent extends AssinaturaProfessorEvent {}