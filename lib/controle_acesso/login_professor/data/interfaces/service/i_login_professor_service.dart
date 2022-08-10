import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';
import '../model/login_professor_entity.dart';

abstract class ILoginProfessorService{
  Future<Either<CommonErrors,LoginProfessorEntity>> login({required String cpf,required String hospital});
}