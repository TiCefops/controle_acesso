
import 'package:cloud_firestore/cloud_firestore.dart';

import '../interface/entity/cadastro_app_entity.dart';
import '../interface/provider/i_cadastro_app_provider.dart';

class CadastroAppProviderImpl implements ICadastroAppProvider {
  final FirebaseFirestore firestore;

  CadastroAppProviderImpl({required this.firestore});
  @override
  Future<CadastroAppEntity> cadastrar(CadastroAppEntity dados) {
    // TODO: implement cadastrar
    throw UnimplementedError();
  }

}