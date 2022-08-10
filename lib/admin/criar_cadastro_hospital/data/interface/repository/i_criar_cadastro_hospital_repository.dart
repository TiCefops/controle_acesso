import '../entity/criar_cadastro_hospital_entity.dart';

abstract class ICriarCadastroHospitalRepository {
  Future<List<CriarCadastroHospitalEntity>> criarCadastroHospital();

}