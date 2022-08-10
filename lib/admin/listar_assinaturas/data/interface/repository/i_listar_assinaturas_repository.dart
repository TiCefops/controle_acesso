import '../entity/listar_assinaturas_entity.dart';

abstract class IListarAssinaturasRepository{
  Future<List<ListarAssinaturasEntity>> listarAssinaturas();
}