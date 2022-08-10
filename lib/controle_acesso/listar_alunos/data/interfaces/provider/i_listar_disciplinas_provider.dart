
import '../entity/listar_disciplinas_entity.dart';

abstract class IListarDisciplinasProvider {

  Future<List<ListarDisciplinasEntity>> listarDisciplinas({required String hospitalID});


}