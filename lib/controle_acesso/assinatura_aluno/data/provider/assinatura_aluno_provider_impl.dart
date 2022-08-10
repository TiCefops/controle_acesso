import 'package:cloud_firestore/cloud_firestore.dart';

import '../interface/entity/assinatura_aluno_enity.dart';
import '../interface/provider/i_assinatura_aluno_provider.dart';

class AssinaturaAlunoProvider implements IAssinaturaAlunoProvider {
  final FirebaseFirestore firestore;

  AssinaturaAlunoProvider({required this.firestore});

  @override
  Future<String> assinarChamada(
      {required AssinaturaAlunoEntity assinatura}) async {
    String id="";
    final CollectionReference aluno = firestore.collection('Alunos');
    final assinaturaRef =
        aluno.doc(assinatura.alunoId).collection("assinaturas");
    await assinaturaRef.add({
      "assinatura": assinatura.assinaturaAluno,
      "tipo": assinatura.tipoEntrada,
      "horaAssinatura": assinatura.horaAssinatura,
      "horaCadastro": Timestamp.now().toString(),
      "hospital":{
        "id": assinatura.hospitalId,
        "hospitalNome":assinatura.hospitalNome,
        "hora":assinatura.horaAssinatura,
      }
    }).then((value) => id=value.id);
   await assinaturaRef.doc(id).update({"id": id});
    return id;
  }
}
