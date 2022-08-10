import '../entity/cadastro_app_entity.dart';

abstract class ICadastroAppRepository {
  Future<CadastroAppEntity>cadastrar(CadastroAppEntity dados);
}