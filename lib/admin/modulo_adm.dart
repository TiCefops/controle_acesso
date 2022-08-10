import 'package:cefops_controll_acess/admin/criar_cadastro_hospital/data/repository/criar_cadastros_repository_impl.dart';
import 'package:cefops_controll_acess/admin/criar_cadastro_hospital/pages/criar_cadastro_hospital_view.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/bloc/listar_assinaturas_bloc.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/provider/listar_assinaturas_provider_impl.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/data/repository/listar_assinaturas_repository_impl.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/pages/listar_assinaturas_page.dart';
import 'package:cefops_controll_acess/admin/listar_assinaturas/service/listar_assinaturas_service_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'criar_cadastro_hospital/bloc/criar_cadastro_hospital_bloc.dart';
import 'criar_cadastro_hospital/data/provider/criar_cadastros_provider_impl.dart';
import 'criar_cadastro_hospital/service/criar_cadastro_hospital_service_impl.dart';

class ModuloAdm extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
            (i) => ListarAssinaturasProviderImpl(FirebaseFirestore.instance)),
        Bind.factory((i) => ListarAssinaturasRepositoryImpl(i())),
        Bind.factory((i) => ListarAssinaturasServiceImpl(i())),
        Bind.factory((i) => ListarAssinaturasBloc(i())),

        Bind.factory((i) =>
            CriarCadastroHospitalProviderImpl(FirebaseFirestore.instance)),
        Bind.factory((i) => CriarCadastroHospitalRepositoryImpl(i())),
        Bind.factory((i) => CriarCadastroHospitalServiceImpl(i())),
        Bind.factory((i) => CriarCadastroHospitalBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ListarAssinaturasPage()),
        ChildRoute('/cadastrar-hospital', child: (context, args) => CriarCadastroHospitalPage()),
      ];
}
