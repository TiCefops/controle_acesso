
import 'package:cloud_firestore/cloud_firestore.dart';

import '../interfaces/entity/adicionar_assinatura_professor_entity.dart';
import '../interfaces/provider/i_adicionar_assinatura_professor_repository.dart';

class AdicionarAssinaturaProfessorProviderImpl implements IAdicionarAssinaturaProfessorProvider{
  final FirebaseFirestore firestore;

  AdicionarAssinaturaProfessorProviderImpl({required this.firestore});
  @override
  Future<String> adicionarAssinaturaProfessor({required AdicionarAssinaturaProfessorEntity assinatura}) async {

    final CollectionReference aluno = firestore.collection('Alunos');
    final assinaturaRef =
    aluno.doc(assinatura.idAluno).collection("assinaturas");
    await assinaturaRef.doc(assinatura.idAssinaturaAluno).update({"hospital": FieldValue.arrayUnion([{
      "idProfessor":assinatura.idProfessor,
      "nomeProfessor":assinatura.nomeProfessor,
      "assinaturaProfessor":assinatura.assinaturaProfessor,
      "nomeDisciplina":assinatura.nomeDisciplina,
      "justificativa":assinatura.justificativa,
      "horaCadastro":Timestamp.now().toDate().toIso8601String()
    }])});
return "oi";

  }

}