import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';
import '../entity/assinatura_aluno_enity.dart';

abstract class IAssinaturaAlunoProvider {
  Future <String> assinarChamada(
      {required AssinaturaAlunoEntity assinatura});
}
