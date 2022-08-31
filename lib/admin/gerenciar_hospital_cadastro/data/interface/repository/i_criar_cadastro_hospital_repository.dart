import '../entity/criar_cadastro_hospital_entity.dart';

abstract class ICriarCadastroHospitalRepository {
  Future<void> criarCadastroHospital({required String email, required String password,required String nome});

}