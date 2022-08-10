import 'package:either_dart/either.dart';
import '../../../core/erros/common_errors.dart';
import '../data/interface/model/i_listar_turmas_entity.dart';
import '../data/interface/repository/i_listar_turmas_repository.dart';
import '../data/interface/services/i_listar_turmas_service.dart';


class ListarTurmasServiceImpl implements IListarTurmasService{
  final IListarTurmasRepository repository;

  ListarTurmasServiceImpl(this.repository);
  @override
  Future<Either<CommonErrors, List<ListarTurmasEntity>>> buscarTodasAsTurmas({required String idProfessor}) async {
    return await repository.buscarTodasAsTurmas(idProfessor: idProfessor);
  }

}