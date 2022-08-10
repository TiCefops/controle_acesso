import '../entity/criar_cadastro_hospital_entity.dart';

abstract class ICriarCadastroHospitalServices{
  Future<List<CriarCadastroHospitalEntity>> criarCadastroHospital();

}