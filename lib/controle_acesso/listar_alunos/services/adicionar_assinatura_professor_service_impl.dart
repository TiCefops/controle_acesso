
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/adicionar_assinatura_professor_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/repository/i_adicionar_assinatura_professor_repository.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/services/i_adicionar_assinatura_professor_service.dart';

class AdicionarAssinaturaProfessorServiceImpl implements IAdicionarAssinaturaProfessorService{
  final IAdicionarAssinaturaProfessorRepository repository;

  AdicionarAssinaturaProfessorServiceImpl(this.repository);
  @override
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura})async {

   return await repository.adicionarAssinaturaProfessor(assinatura: assinatura);
  }
}