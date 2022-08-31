
abstract class ICriarCadastroHospitalProvider {
  Future<void> criarCadastroHospital({required String email, required String password,required String nome});
}