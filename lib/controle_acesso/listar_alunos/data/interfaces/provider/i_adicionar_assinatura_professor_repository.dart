import '../entity/adicionar_assinatura_professor_entity.dart';

abstract class IAdicionarAssinaturaProfessorProvider {
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura});


}