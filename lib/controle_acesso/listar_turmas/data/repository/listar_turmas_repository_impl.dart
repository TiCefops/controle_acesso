
import 'package:either_dart/either.dart';
import '../../../../core/erros/common_errors.dart';
import '../interface/model/i_listar_turmas_entity.dart';
import '../interface/provider/i_listar_turmas_provider.dart';
import '../interface/repository/i_listar_turmas_repository.dart';


class ListarTurmasRepositoryImpl implements IListarTurmasRepository{

  final IListarTurmasProvider provider;
  ListarTurmasRepositoryImpl(this.provider);

  @override
  Future<Either<CommonErrors, List<ListarTurmasEntity>>> buscarTodasAsTurmas({required String idProfessor}) async {
    return await provider.buscarTodasAsTurmas(idTurma: idProfessor);
  }


}