
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/provider/i_listar_alunos_provider.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/provider/i_listar_turmas_provider.dart';
import 'package:either_dart/either.dart';
import '../../../../core/erros/common_errors.dart';
import '../interfaces/entity/listar_alunos_entity.dart';
import '../interfaces/repository/i_listar_alunos_repository.dart';

class ListarAlunosRepositoryImpl implements IListarAlunosRepository{

  final IListarAlunosProvider provider;
  ListarAlunosRepositoryImpl({required this.provider});

  @override
  Future<Either<CommonErrors, List<ListarAlunosEntity>>> ListarAlunos({required String idTurma}) async {
    return await provider.ListarAlunos(idTurma: idTurma);
  }

}