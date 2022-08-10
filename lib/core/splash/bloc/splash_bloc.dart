import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/firebase/remote_config/remote_config_configure.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SlpashEvent, SlpashState> {
  SplashBloc() : super(SlpashState().init()) {
    on<InitEvent>(_init);
    on<NavegarEvent>(_verificar);
  }

  void _init(InitEvent event, Emitter<SlpashState> emit) async {
    final RemoteConfigConfigure remoteConfig=RemoteConfigConfigure();
    await remoteConfig.initRemoteConfig();
    emit(state.clone());
  }

  Future<void> _verificar(NavegarEvent event, Emitter<SlpashState> emit) async{
    FirebaseAuth auth =FirebaseAuth.instance;
    User? user=auth.currentUser;
    if(user!=null){
      FirebaseCrashlytics.instance.setUserIdentifier(user.uid);

      await Modular.to.pushReplacementNamed("/controle_acesso/");
    }else{
     await Modular.to.pushReplacementNamed("/login");

    }

  }
}
