import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/model/login_professor_entity.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/repository/i_login_professor_repository.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/interfaces/service/i_login_professor_service.dart';
import 'package:cefops_controll_acess/core/erros/common_errors.dart';
import 'package:either_dart/either.dart';


class LoginProfessorServiceImpl implements ILoginProfessorService {
  final ILoginProfessorRepository repository;

  LoginProfessorServiceImpl(this.repository);

  @override
  Future<Either<CommonErrors, LoginProfessorEntity>> login(
      {required String cpf, required String hospital}) async {
    return await repository.login(cpf: cpf, hospital: hospital);
  }
}
