import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/provider/i_login_professor_provider.dart';
import 'package:either_dart/src/either.dart';

import '../../../../core/erros/common_errors.dart';
import '../interfaces/model/login_professor_entity.dart';
import '../interfaces/repository/i_login_professor_repository.dart';

class LoginProfessorRepositoryImpl implements ILoginProfessorRepository{
  final ILoginProfessorProvider provider;

  LoginProfessorRepositoryImpl(this.provider);
  @override
  Future<Either<CommonErrors, LoginProfessorEntity>> login({required String cpf,required String hospital}) async{
   return await provider.login(cpf: cpf,hospital: hospital);
  }
}