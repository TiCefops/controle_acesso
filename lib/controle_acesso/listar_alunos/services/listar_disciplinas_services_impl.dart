
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/services/i_listar_discplinas_services.dart';

import '../data/interfaces/entity/listar_disciplinas_entity.dart';
import '../data/interfaces/repository/i_listar_disciplinas_repository.dart';

class ListarDisciplinasServicesImpl implements IListarDisciplinasServices{

  final IListarDisciplinasRepository repository;

  ListarDisciplinasServicesImpl(this.repository);

  @override
  Future<List<ListarDisciplinasEntity>> listarDisciplinas({required String hospitalID}) async{
    return await repository.listarDisciplinas(hospitalID: hospitalID);
  }

}