import '../entity/listar_assinaturas_entity.dart';

abstract class IListarAssinaturasServices{
  Future<List<ListarAssinaturasEntity>> listarAssinaturas();
}