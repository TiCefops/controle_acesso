import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import '../../../../controle_acesso/listar_turmas/data/model/listar_turmas_model.dart';
import '../interface/provider/i_gerenciar_turma_provider.dart';

class GerenciarTurmaProviderImpl implements IGerenciarTurmaProvider {
  final FirebaseFirestore firestore;

  GerenciarTurmaProviderImpl({required this.firestore});

  @override
  Future<List<ListarTurmasEntity>> buscarTodasTurmas() async {
    final CollectionReference turmas = firestore.collection('turmas');
    final dados=await turmas.get();
    if ( dados.docs.isNotEmpty) {
      dados.docs.map((e) {
        Map<String, dynamic> dados = {
          "status": e.get("status"),
          "nome": e.get("nome"),
          "id": e.get("id"),
          "horaEntrada": e.get("horaEntrada"),
          "horaSaida": e.get("horaSaida"),
          "dataInicio": e.get("dataInicio").toString(),
          "dataFim": e.get("dataFim").toString(),
          "disciplina": e.get("disciplina"),
        };
        return ListarTurmasModelImpl.fromJson(dados);
      }).toList();
    }
    List<ListarTurmasEntity> turmaNull=[];

      return turmaNull;

  }

  @override
  Future<void> buscarTurmas({required String turmaId}) async {
    final CollectionReference turma = firestore.collection('turmas');
  }

  @override
  Future<void> criarTurma({required String turmaId}) {
    // TODO: implement criarTurma
    throw UnimplementedError();
  }

  @override
  Future<void> editarTurma({required String turmaId}) {
    // TODO: implement editarTurma
    throw UnimplementedError();
  }
}
