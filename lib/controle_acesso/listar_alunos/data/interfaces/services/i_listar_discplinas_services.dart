import '../entity/listar_disciplinas_entity.dart';

abstract class IListarDisciplinasServices{
  Future<List<ListarDisciplinasEntity>> listarDisciplinas({required String hospitalID});

}
