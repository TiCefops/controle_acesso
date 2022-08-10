import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/interface/repository/i_assinatura_aluno_repository.dart';
import 'package:either_dart/either.dart';

import '../../../../core/erros/common_errors.dart';
import '../interface/entity/assinatura_aluno_enity.dart';
import '../interface/services/i_assinatura_aluno_service.dart';

class AssinaturaAlunoServiceImpl implements IAssinaturaAlunoService {
  final IAssinaturaAlunoRepository repository;

  AssinaturaAlunoServiceImpl(this.repository);

  @override
  Future<String> assinarChamada(
      {required AssinaturaAlunoEntity assinatura}) async {
   return  await repository.assinarChamada(assinatura: assinatura);
  }
}
