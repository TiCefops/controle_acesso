import '../entity/listar_disciplinas_entity.dart';

abstract class IListarDisciplinasRepository{
  Future<List<ListarDisciplinasEntity>> listarDisciplinas({required String hospitalID});

}