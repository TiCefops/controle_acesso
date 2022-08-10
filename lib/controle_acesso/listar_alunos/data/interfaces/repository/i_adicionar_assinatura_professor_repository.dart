
import '../entity/adicionar_assinatura_professor_entity.dart';

abstract class IAdicionarAssinaturaProfessorRepository {
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura});


}