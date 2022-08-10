import 'package:bloc/bloc.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/entity/listar_assinaturas_entity.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/services/i_listar_assinaturas_services.dart';

import 'listar_assinaturas_event.dart';
import 'listar_assinaturas_state.dart';

class ListarAssinaturasBloc extends Bloc<ListarAssinaturasEvent, ListarAssinaturasState> {
  final IListarAssinaturasServices services;

  ListarAssinaturasBloc(this.services) : super(ListarAssinaturasState().init()) {
    on<InitEvent>(_init);
    on<CarregadoEvent>(_carregadoEvent);
  }

  void _init(InitEvent event, Emitter<ListarAssinaturasState> emit) async {
    emit(state.clone());
  }
  void _carregadoEvent(CarregadoEvent event, Emitter<ListarAssinaturasState> emit) async{
    List<ListarAssinaturasEntity> dados = await services.listarAssinaturas();
    emit(CarregadoState(dados));
  }
}
