

import '../../../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import '../entity/turma_entity.dart';

abstract class IGerenciarTurmaRepository {
  Future<List<ListarTurmasEntity>> buscarTodasTurmas();
  Future<void> buscarTurmas({required String turmaId});
  Future<TurmaEntity> editarTurma({required String turmaId});
  Future<void> criarTurma({required String turmaId});
}