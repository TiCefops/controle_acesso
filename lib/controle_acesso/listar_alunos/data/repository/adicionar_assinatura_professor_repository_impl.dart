import '../interfaces/entity/adicionar_assinatura_professor_entity.dart';
import '../interfaces/provider/i_adicionar_assinatura_professor_repository.dart';
import '../interfaces/repository/i_adicionar_assinatura_professor_repository.dart';


class AdicionarAssinaturaProfessorRepositoryImpl implements IAdicionarAssinaturaProfessorRepository{
  final IAdicionarAssinaturaProfessorProvider provider;

  AdicionarAssinaturaProfessorRepositoryImpl(this.provider);
  @override
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura})async {
    return await provider.adicionarAssinaturaProfessor(assinatura: assinatura);
  }
}