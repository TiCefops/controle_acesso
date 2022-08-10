import 'package:cefops_controll_acess/core/cadastro_app/pages/cadastro_app_view.dart';

class CadastroAppState {
  CadastroAppState init() {
    return CadastroAppState();
  }

  CadastroAppState clone() {
    return CadastroAppState();
  }
}
class ErrorState extends Cadastro_appPage{
  final  String message;
  ErrorState({required this.message});
}

class CadastroConcluidoState extends Cadastro_appPage{
  final  bool load;

  CadastroConcluidoState({required this.load});
}

