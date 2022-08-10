import '../entity/adicionar_assinatura_professor_entity.dart';

abstract class IAdicionarAssinaturaProfessorService {
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura});


}