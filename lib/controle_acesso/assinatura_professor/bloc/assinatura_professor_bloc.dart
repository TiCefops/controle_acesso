import 'package:bloc/bloc.dart';

import 'assinatura_professor_event.dart';
import 'assinatura_professor_state.dart';





class AssinaturaProfessorBloc extends Bloc<AssinaturaProfessorEvent, AssinaturaProfessorState> {
  AssinaturaProfessorBloc() : super(AssinaturaProfessorState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<AssinaturaProfessorState> emit) async {
    emit(state.clone());
  }
}
