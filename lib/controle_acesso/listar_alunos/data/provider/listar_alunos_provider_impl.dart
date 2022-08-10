
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import '../../../../core/erros/common_errors.dart';
import '../interfaces/entity/listar_alunos_entity.dart';
import '../interfaces/provider/i_listar_alunos_provider.dart';
import '../model/listar_alunos_model.dart';

class ListarAlunosProviderImpl implements IListarAlunosProvider {
  final FirebaseFirestore firestore;

  ListarAlunosProviderImpl({required this.firestore});

  @override
  Future<Either<CommonErrors, List<ListarAlunosEntity>>> ListarAlunos({required String idTurma}) async {

    final CollectionReference aluno = firestore.collection('Alunos');
    final alunos = await aluno.where("turmas",arrayContains:idTurma).orderBy("nome",descending:false).get();


    if(alunos.docs.isNotEmpty){
      return Right(alunos.docs.map((e) {
        Map<String, dynamic> dados = {
          "nome": e.get('nome'),
          "id": e.get('id'),
          "cpf": e.get('cpf'),
          "status": e.get('status'),
          "turmas": e.get('turmas')
        };
        return ListarAlunosModel.fromJson(dados);
      }).toList());
    }else{
      final CommonErrors erro = CommonErrors(key: CommonErrorCode.notFound);
      return Left(erro);
    }
  }
  }

