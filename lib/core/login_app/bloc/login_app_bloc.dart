import 'package:cefops_controll_acess/core/login_app/services/hospital_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../services/login_app_service.dart';
import 'login_app_event.dart';
import 'login_app_state.dart';

class LoginAppBloc extends Bloc<LoginAppEvent, LoginAppState> {
  LoginAppBloc() : super(LoginAppState().init()) {
    on<InitEvent>(_init);
    on<ErrorEvent>(_onError);
    on<LoginSubmittedEvent>(_onSubmit);
  }

  void _init(InitEvent event, Emitter<LoginAppState> emit) async {


    emit(state.clone());
  }

  void _onError(ErrorEvent event, Emitter<LoginAppState> emit) async {
    emit(ErrorState(message: "Error Descohecido"));
  }

  void _onSubmit(LoginSubmittedEvent event, Emitter<LoginAppState> emit) async {
    emit(LoginSubmittedState(load: true));
    try {
      AuthenticationHelper helper =
          AuthenticationHelper(auth: FirebaseAuth.instance);

   await   helper
          .signIn(email: event.email, password: event.password)
          .then((result) async{
        if(result is UserCredential){
          Modular.to.navigate("/controle_acesso/");

        }else{

          emit(LoginSubmittedState(load: false));
          emit(ErrorState(message: "$result"));

        }
      } );

    } catch (e) {
      emit(LoginSubmittedState(load: false));
      emit(ErrorState(message: "$e"));
    }
  }
}
