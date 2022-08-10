import 'package:cefops_controll_acess/core/cadastro_app/data/interface/provider/i_cadastro_app_provider.dart';

import '../interface/entity/cadastro_app_entity.dart';
import '../interface/repository/i_cadastro_app_repository.dart';


class CadastroAppRepositoryImpl implements ICadastroAppRepository{
  final ICadastroAppProvider provider;

  CadastroAppRepositoryImpl({required this.provider});
  @override
  Future<CadastroAppEntity> cadastrar(CadastroAppEntity dados) {
    // TODO: implement cadastrar
    throw UnimplementedError();
  }

}