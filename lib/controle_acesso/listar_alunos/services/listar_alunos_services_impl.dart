
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/repository/i_listar_alunos_repository.dart';
import 'package:either_dart/either.dart';
import '../../../core/erros/common_errors.dart';
import '../data/interfaces/entity/listar_alunos_entity.dart';
import '../data/interfaces/services/i_listar_alunos_services.dart';


class ListarAlunosServicesImpl implements IListarAlunosServices{

  final IListarAlunosRepository repository;
  ListarAlunosServicesImpl(this.repository);

  @override
  Future<Either<CommonErrors, List<ListarAlunosEntity>>> listarAlunos({required String idTurma}) async {
      return await repository.ListarAlunos(idTurma: idTurma);
  }

}