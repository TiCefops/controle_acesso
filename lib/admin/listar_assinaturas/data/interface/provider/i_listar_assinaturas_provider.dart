
import '../entity/listar_assinaturas_entity.dart';

abstract class IListarAssinaturasProvider {
  Future<List<ListarAssinaturasEntity>> listarAssinaturas();
}