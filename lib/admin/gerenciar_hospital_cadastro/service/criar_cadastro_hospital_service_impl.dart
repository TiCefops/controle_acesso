import '../data/interface/entity/criar_cadastro_hospital_entity.dart';
import '../data/interface/repository/i_criar_cadastro_hospital_repository.dart';
import '../data/interface/services/i_criar_cadastro_hospital_services.dart';

class CriarCadastroHospitalServiceImpl
    implements ICriarCadastroHospitalServices {
  final ICriarCadastroHospitalRepository repository;

  CriarCadastroHospitalServiceImpl(this.repository);

  @override
  Future<void> criarCadastroHospital(
      {required String email,
      required String password,
      required String nome}) async {
    await repository.criarCadastroHospital(
        email: email, password: password, nome: nome);
  }
}
