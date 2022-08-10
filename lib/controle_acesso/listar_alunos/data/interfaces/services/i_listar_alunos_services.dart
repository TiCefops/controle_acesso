import 'package:either_dart/either.dart';
import '../../../../../core/erros/common_errors.dart';
import '../entity/listar_alunos_entity.dart';

abstract class IListarAlunosServices {
  Future<Either<CommonErrors, List<ListarAlunosEntity>>> listarAlunos(
      {required String idTurma});


}