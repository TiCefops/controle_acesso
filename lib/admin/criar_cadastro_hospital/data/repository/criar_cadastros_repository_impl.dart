


import '../interface/entity/criar_cadastro_hospital_entity.dart';
import '../interface/provider/i_criar_cadastro_hospital_provider.dart';
import '../interface/repository/i_criar_cadastro_hospital_repository.dart';

class CriarCadastroHospitalRepositoryImpl implements ICriarCadastroHospitalRepository{
   final ICriarCadastroHospitalProvider provider;

  CriarCadastroHospitalRepositoryImpl(this.provider);

  @override
  Future<List<CriarCadastroHospitalEntity>> criarCadastroHospital() {
    // TODO: implement criarCadastroHospital
    throw UnimplementedError();
  }

}