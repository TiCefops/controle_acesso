
import 'package:cefops_controll_acess/admin/gerenciar_turma/data/interface/repository/i_gerenciar_turma_repository.dart';

import '../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import '../../../controle_acesso/listar_turmas/data/model/listar_turmas_model.dart';
import '../data/interface/entity/turma_entity.dart';
import '../data/interface/service/i_gerenciar_turma_service.dart';

class GerenciarTurmaServiceImpl implements IGerenciarTurmaService{
  final IGerenciarTurmaRepository repository;

  GerenciarTurmaServiceImpl({required this.repository});

  @override
  Future<List<ListarTurmasEntity>> buscarTodasTurmas() async{
    final dados = await repository.buscarTodasTurmas();
    return dados;
  }
  @override
  Future<TurmaEntity> buscarTurmas({required String turmaId}) {
    // TODO: implement buscarTurmas
    throw UnimplementedError();
  }

  @override
  Future<void> criarTurma({required String turmaId})async {
  }

  @override
  Future<TurmaEntity> editarTurma({required String turmaId}) {
    // TODO: implement editarTurma
    throw UnimplementedError();
  }
}