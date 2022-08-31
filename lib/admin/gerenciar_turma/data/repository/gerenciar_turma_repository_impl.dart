
import 'package:cefops_controll_acess/admin/gerenciar_turma/data/interface/provider/i_gerenciar_turma_provider.dart';

import '../../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import '../interface/entity/turma_entity.dart';
import '../interface/repository/i_gerenciar_turma_repository.dart';

class GerenciarTurmaRepositoryImpl implements IGerenciarTurmaRepository{
  final IGerenciarTurmaProvider provider;

  GerenciarTurmaRepositoryImpl({required this.provider});
  @override
  Future<List<ListarTurmasEntity>> buscarTodasTurmas() async{
  return await provider.buscarTodasTurmas();
  }
  @override
  Future<void> buscarTurmas({required String turmaId}) {
    // TODO: implement buscarTurmas
    throw UnimplementedError();
  }

  @override
  Future<void> criarTurma({required String turmaId}) {
    // TODO: implement criarTurma
    throw UnimplementedError();
  }

  @override
  Future<TurmaEntity> editarTurma({required String turmaId}) {
    // TODO: implement editarTurma
    throw UnimplementedError();
  }
}