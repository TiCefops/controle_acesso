
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/login_professor_entity.dart';
import 'package:either_dart/either.dart';

import '../../../../../core/erros/common_errors.dart';


abstract class ILoginProfessorRepository{
  Future<Either<CommonErrors,LoginProfessorEntity>> login({required String cpf,required String hospital});
}