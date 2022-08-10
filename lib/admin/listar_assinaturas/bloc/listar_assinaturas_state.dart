import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/entity/listar_assinaturas_entity.dart';
import 'package:equatable/equatable.dart';

class ListarAssinaturasState extends Equatable {
  ListarAssinaturasState init() {
    return ListarAssinaturasState();
  }

  ListarAssinaturasState clone() {
    return ListarAssinaturasState();
  }

  @override
  List<Object> get props {
    return [];
  }
}
class CarregadoState extends ListarAssinaturasState {
  final List<ListarAssinaturasEntity> dados;

  CarregadoState(this.dados);
}
