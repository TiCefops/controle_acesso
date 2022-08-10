import 'package:cefops_controll_acess/admin/criar_cadastro_hospital/data/interface/entity/criar_cadastro_hospital_entity.dart';

abstract class ICriarCadastroHospitalProvider {
  Future<List<CriarCadastroHospitalEntity>> criarCadastroHospital();
}