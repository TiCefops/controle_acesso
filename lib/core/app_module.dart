import 'package:cefops_controll_acess/controle_acesso/modulo_acesso.dart';
import 'package:cefops_controll_acess/core/cadastro_app/bloc/cadastro_app_bloc.dart';
import 'package:cefops_controll_acess/core/cadastro_app/data/provider/cadastro_app_provider_impl.dart';
import 'package:cefops_controll_acess/core/cadastro_app/data/repository/cadastro_app_repository_impl.dart';
import 'package:cefops_controll_acess/core/cadastro_app/data/service/cadastro_app_service_impl.dart';
import 'package:cefops_controll_acess/core/login_app/pages/login_app_page.dart';
import 'package:cefops_controll_acess/core/splash/bloc/splash_bloc.dart';
import 'package:cefops_controll_acess/core/splash/page/splash_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../admin/modulo_adm.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) =>
            CadastroAppProviderImpl(firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => CadastroAppRepositoryImpl(provider: i())),
        Bind.factory((i) => CadastroAppServiceImpl(repository: i())),
        Bind.factory((i) => CadastroAppBloc(service: i())),
        Bind.factory((i) => SplashBloc()),

      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/login', child: (context, args) => const LoginAppPage()),
        ModuleRoute('/controle_acesso',
            module: ModuloAcesso(), transition: TransitionType.noTransition),
        ModuleRoute('/adm',
            module: ModuloAdm(), transition: TransitionType.noTransition),
      ];
}
