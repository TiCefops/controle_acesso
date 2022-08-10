
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/provider/i_listar_assinaturas_provider.dart';

import '../interface/entity/listar_assinaturas_entity.dart';
import '../interface/repository/i_listar_assinaturas_repository.dart';

class ListarAssinaturasRepositoryImpl implements IListarAssinaturasRepository{
  final IListarAssinaturasProvider provider;

  ListarAssinaturasRepositoryImpl(this.provider);

  @override
  Future<List<ListarAssinaturasEntity>> listarAssinaturas() async {
    return await provider.listarAssinaturas();
  }

}