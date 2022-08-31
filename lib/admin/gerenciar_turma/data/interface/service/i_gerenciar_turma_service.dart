
import 'package:cefops_controll_acess/admin/gerenciar_turma/data/interface/entity/turma_entity.dart';

import '../../../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';

abstract class IGerenciarTurmaService {
  Future<List<ListarTurmasEntity>> buscarTodasTurmas();
  Future<TurmaEntity> buscarTurmas({required String turmaId});
  Future<TurmaEntity> editarTurma({required String turmaId});
  Future<void> criarTurma({required String turmaId});
}