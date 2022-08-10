
import '../entity/assinatura_aluno_enity.dart';

abstract class IAssinaturaAlunoService {
  Future<String> assinarChamada(
      {required AssinaturaAlunoEntity assinatura});
}
