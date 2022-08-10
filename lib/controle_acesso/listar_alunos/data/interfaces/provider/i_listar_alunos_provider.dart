import 'package:either_dart/either.dart';
import '../../../../../core/erros/common_errors.dart';
import '../entity/listar_alunos_entity.dart';

abstract class IListarAlunosProvider {
  Future<Either<CommonErrors, List<ListarAlunosEntity>>> ListarAlunos({required String idTurma});

}