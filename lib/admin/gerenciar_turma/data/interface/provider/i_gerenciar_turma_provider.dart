

import '../../../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';

abstract class IGerenciarTurmaProvider {
  Future<List<ListarTurmasEntity>> buscarTodasTurmas();
  Future<void> buscarTurmas({required String turmaId});
  Future<void> editarTurma({required String turmaId});
  Future<void> criarTurma({required String turmaId});
}