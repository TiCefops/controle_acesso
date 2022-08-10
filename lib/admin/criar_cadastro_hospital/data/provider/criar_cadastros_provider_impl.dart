
import 'package:cloud_firestore/cloud_firestore.dart';

import '../interface/entity/criar_cadastro_hospital_entity.dart';
import '../interface/provider/i_criar_cadastro_hospital_provider.dart';

class CriarCadastroHospitalProviderImpl implements ICriarCadastroHospitalProvider {
  final FirebaseFirestore firestore;

  CriarCadastroHospitalProviderImpl(this.firestore);

  @override
  Future<List<CriarCadastroHospitalEntity>> criarCadastroHospital() {
    // TODO: implement criarCadastroHospital
    throw UnimplementedError();
  }

}