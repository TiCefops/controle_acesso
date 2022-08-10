import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_disciplinas_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/model/listar_disciplinas_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../admin/listar_assinaturas/data/interface/entity/listar_assinaturas_entity.dart';
import '../../../../admin/listar_assinaturas/data/interface/provider/i_listar_assinaturas_provider.dart';
import '../interfaces/provider/i_listar_disciplinas_provider.dart';

class ListarDisciplinasProviderImpl implements IListarDisciplinasProvider {
  final FirebaseFirestore firestore;

  ListarDisciplinasProviderImpl({required this.firestore});

  @override
  Future<List<ListarDisciplinasEntity>> listarDisciplinas(
      {required String hospitalID}) async {
    try {
      List<ListarDisciplinasModel> dados = [];

      CollectionReference hospitais = firestore.collection("hospitais");
      final disciplinas = await hospitais.doc(hospitalID).get();
      final data = disciplinas.get('disciplinas') as List<dynamic>;
      if (data.isNotEmpty) {
        for (var element in data) {
          Map<String, dynamic> mapaDisciplina = {
            "nome": element['nome'],
            "id": element['id'],
            "maxAluno": element['maxAluno'],
            "status": element['status'],
            "andar": element['andar']
          };
          ListarDisciplinasModel model = ListarDisciplinasModel.fromJson(
              mapaDisciplina);
          dados.add(model);
        }
      }
      return dados;
    } catch (e) {
      rethrow;
    }
  }
}
