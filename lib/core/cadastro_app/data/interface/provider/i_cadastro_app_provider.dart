import '../entity/cadastro_app_entity.dart';

abstract class ICadastroAppProvider {
  Future<CadastroAppEntity>cadastrar(CadastroAppEntity dados);
}