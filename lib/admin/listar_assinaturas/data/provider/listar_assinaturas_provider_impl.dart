
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/entity/listar_assinaturas_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../interface/provider/i_listar_assinaturas_provider.dart';
import '../model/listar_alunos_model.dart';

class ListarAssinaturasProviderImpl implements IListarAssinaturasProvider {
  final FirebaseFirestore firestore;

  ListarAssinaturasProviderImpl(this.firestore);

  @override
  Future<List<ListarAssinaturasEntity>> listarAssinaturas() async {
    final data = await firestore.collection("Alunos").doc("bjvRfzB1hwkqJPWAmzkI").collection("assinaturas").get();
    print(data.docs.length);
    return data.docs.map((e){
    print(e.data());
    return  ListarAssinaturasModel.fromJson(e.data());
    }).toList();

  }

}