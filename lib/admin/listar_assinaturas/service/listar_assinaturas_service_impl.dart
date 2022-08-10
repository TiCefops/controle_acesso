
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/repository/i_listar_assinaturas_repository.dart';

import '../data/interface/entity/listar_assinaturas_entity.dart';
import '../data/interface/services/i_listar_assinaturas_services.dart';

class ListarAssinaturasServiceImpl implements IListarAssinaturasServices{
  final IListarAssinaturasRepository repository;

  ListarAssinaturasServiceImpl(this.repository);

  @override
  Future<List<ListarAssinaturasEntity>> listarAssinaturas() async {
    return await repository.listarAssinaturas();
  }

}