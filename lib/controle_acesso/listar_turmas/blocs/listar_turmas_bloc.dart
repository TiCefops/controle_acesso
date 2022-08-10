import 'package:bloc/bloc.dart';

import '../data/interface/services/i_listar_turmas_service.dart';
import 'listar_turmas_event.dart';
import 'listar_turmas_state.dart';

class ListarTurmasBloc extends Bloc<ListarTurmasEvent, ListarTurmasState> {
  final IListarTurmasService service;
  ListarTurmasBloc({required this.service}) : super(ListarTurmasState().init()) {
    on<InitEvent>(_init);
    on<CarregandoEvent>(_carregarDados);
  }

  void _init(InitEvent event, Emitter<ListarTurmasState> emit) async {
    emit(state.clone());

  }

  Future _carregarDados(CarregandoEvent event, Emitter<ListarTurmasState> emit) async {
    emit(CarregandoState());
    final turmas = await service.buscarTodasAsTurmas(idProfessor: event.idProfessor);
    if(turmas.isRight){
      emit(CarregadoState(turmas: turmas.right));
    }else{emit(ErrorState(message: "Não Encontramos Turmas para seu ID: "));}
  }
}
