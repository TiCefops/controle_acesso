import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/login_app/services/hospital_service.dart';
import '../data/interfaces/service/i_login_professor_service.dart';
import 'event.dart';
import 'state.dart';

class LoginProfessorBloc
    extends Bloc<LoginProfessorBlocEvent, LoginProfessorBlocState> {
  LoginProfessorBloc(this.service) : super(LoginProfessorBlocState().init()) {
    on<InitEvent>(_init);
    on<LoginProfessorFetchData>(_onLogin);
  }

  final ILoginProfessorService service;

  void _init(InitEvent event, Emitter<LoginProfessorBlocState> emit) async {
    emit(state.clone());
  }

  void _onLogin(LoginProfessorFetchData event,
      Emitter<LoginProfessorBlocState> emit) async {
    emit(LoginProfessorBlocLoadingState());
    String hospital = FirebaseAuth.instance.currentUser!.uid;
    HospitalService hospitalServiceervice = HospitalService();

    final professor = await service.login(cpf: event.cpf, hospital: hospital);

    final hospitalMap = await hospitalServiceervice.getHospitalInfo(
        id: FirebaseAuth.instance.currentUser!.uid);

    if (professor.isRight) {
      emit(LoginProfessorBlocSuccessState(professor: professor.right));
      Modular.to.pushReplacementNamed(
          './listar_turmas?emailHospital=${hospitalMap["email"]}',
          arguments: professor.right);
    } else {
      emit(LoginProfessorBlocErrorState(message: "CPF Não Localizado"));
    }
  }
}
