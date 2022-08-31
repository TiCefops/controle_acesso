import 'package:bloc/bloc.dart';

import '../data/interface/service/i_gerenciar_turma_service.dart';
import 'gerenciar_turma_event.dart';
import 'gerenciar_turma_state.dart';

class GerenciarTurmaBloc extends Bloc<GerenciarTurmaEvent, GerenciarTurmaState> {
  final IGerenciarTurmaService service;
  GerenciarTurmaBloc({required this.service}) : super(GerenciarTurmaState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<GerenciarTurmaState> emit) async {
    emit(state.clone());
  }
}
