
import '../entity/cadastro_app_entity.dart';

abstract class ICadastroAppServices {
  Future<void>cadastrar(CadastroAppEntity dados);
}