import 'package:equatable/equatable.dart';

class CriarCadastroHospitalState  extends Equatable{
  CriarCadastroHospitalState init() {
    return CriarCadastroHospitalState();
  }

  CriarCadastroHospitalState clone() {
    return CriarCadastroHospitalState();
  }
  @override
  List<Object> get props {
    return [];
  }

}
class EnviarCadastoHospitalState extends CriarCadastroHospitalState{


  @override
  List<Object> get props {
    return [];
  }

}
class CriarHospitalState extends CriarCadastroHospitalState{
  final int click;

  CriarHospitalState(this.click);
  @override
  List<Object> get props {
    return [click];
  }

}

class CriarDisciplinaState extends CriarCadastroHospitalState{}

class CriarProfessorState extends CriarCadastroHospitalState{}


class ClickRadioButtonState extends CriarCadastroHospitalState{


}

class ConcluirCadastroState extends CriarCadastroHospitalState{}

