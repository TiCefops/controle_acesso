import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';



import 'core/app_module.dart';
import 'core/app_widget.dart';
import 'firebase_options.dart';

void main()async{
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;


  return runApp(ModularApp(module: AppModule(), child:const AppWidget()));
},(error, stack) =>
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
      }