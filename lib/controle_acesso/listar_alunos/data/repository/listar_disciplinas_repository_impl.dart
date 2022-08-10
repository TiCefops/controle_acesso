import '../interfaces/entity/listar_disciplinas_entity.dart';
import '../interfaces/provider/i_listar_disciplinas_provider.dart';
import '../interfaces/repository/i_listar_disciplinas_repository.dart';

class ListarDisciplinasRepositoryImpl implements IListarDisciplinasRepository {
  final IListarDisciplinasProvider provider;
  ListarDisciplinasRepositoryImpl(this.provider);


  @override
  Future<List<ListarDisciplinasEntity>> listarDisciplinas({required String hospitalID}) async {
    return await provider.listarDisciplinas(hospitalID: hospitalID);
  }

}