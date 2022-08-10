import 'package:either_dart/either.dart';

import '../model/login_professor_model_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../interfaces/model/login_professor_entity.dart';
import '../interfaces/provider/i_login_professor_provider.dart';
import '../../../../core/erros/common_errors.dart';

class LoginProfessorProviderImpl implements ILoginProfessorProvider {
  final FirebaseFirestore firestore;

  LoginProfessorProviderImpl({required this.firestore});

  @override
  Future<Either<CommonErrors, LoginProfessorEntity>> login(
      {required String cpf,required String hospital} ) async {
    CollectionReference hospitais = firestore.collection("hospitais");
    final professor = await hospitais.doc(hospital).collection("professores").where(
        "cpf", isEqualTo: cpf).get();

    if (professor.docs.isNotEmpty){
      return Right(     LoginProfessorModelImpl.fromJson(professor.docs.first.data())
      );
    }else{
      CommonErrors erro=const CommonErrors(key:CommonErrorCode.notFound );
      return Left(erro);
    }
  }

}