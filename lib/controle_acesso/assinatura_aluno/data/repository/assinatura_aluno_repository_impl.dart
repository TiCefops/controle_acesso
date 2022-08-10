


import '../interface/entity/assinatura_aluno_enity.dart';
import '../interface/provider/i_assinatura_aluno_provider.dart';
import '../interface/repository/i_assinatura_aluno_repository.dart';

class AssinaturaAlunoRepositoryImpl implements IAssinaturaAlunoRepository{
  final IAssinaturaAlunoProvider provider;

  AssinaturaAlunoRepositoryImpl(this.provider);

  @override
  Future<String> assinarChamada({required AssinaturaAlunoEntity assinatura})async {
return   await provider.assinarChamada(assinatura: assinatura);
  }
}