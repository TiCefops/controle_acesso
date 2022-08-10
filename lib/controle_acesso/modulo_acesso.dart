import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/bloc/bloc.dart';
import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/provider/assinatura_aluno_provider_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/repository/assinatura_aluno_repository_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/service/assinatura_aluno_service_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/provider/listar_alunos_provider_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/provider/listar_disciplinas_provider_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/repository/listar_alunos_repository_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/repository/listar_disciplinas_repository_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/pages/listar_alunos_page.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/services/adicionar_assinatura_professor_service_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/services/listar_alunos_services_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_alunos/services/listar_disciplinas_services_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/blocs/listar_turmas_bloc.dart';
import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/provider/listar_turmas_provider_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/blocs/bloc.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/provider/login_professor_provider_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/data/repository/login_professor_repository_impl.dart';
import 'package:cefops_controll_acess/controle_acesso/login_professor/services/login_professor_service_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'acao/pages/acao_page.dart';
import 'assinatura_aluno/pages/assinatura_aluno_page.dart';
import 'assinatura_professor/page/assinatura_professor_page.dart';
import 'listar_alunos/bloc/listar_alunos_bloc.dart';
import 'listar_alunos/data/provider/adicionar_assinatura_professor_provider_impl.dart';
import 'listar_alunos/data/repository/adicionar_assinatura_professor_repository_impl.dart';
import 'listar_turmas/data/repository/listar_turmas_repository_impl.dart';
import 'listar_turmas/pages/listar_turmas_page.dart';
import 'listar_turmas/services/listar_turmas_service_impl.dart';
import 'login_professor/pages/login_professor_page.dart';

class ModuloAcesso extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) =>
            LoginProfessorProviderImpl(firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => LoginProfessorRepositoryImpl(i())),
        Bind.factory((i) => LoginProfessorServiceImpl(i())),
        Bind.factory((i) => LoginProfessorBloc(i())),
        Bind.factory((i) =>
            ListarTurmasProviderImpl(firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => ListarTurmasRepositoryImpl(i())),
        Bind.factory((i) => ListarTurmasServiceImpl(i())),
        Bind.factory((i) => ListarTurmasBloc(service: i())),
        Bind.factory((i) =>
            ListarAlunosProviderImpl(firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => ListarAlunosRepositoryImpl(provider: i())),
        Bind.factory((i) => ListarAlunosServicesImpl(i())),
        Bind.factory((i) => AdicionarAssinaturaProfessorProviderImpl(
            firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => AdicionarAssinaturaProfessorRepositoryImpl(i())),
        Bind.factory((i) => AdicionarAssinaturaProfessorServiceImpl(i())),
        BlocBind.singleton(
          (i) =>
              ListarAlunosBloc(service: i(), assinaturaProfessorServices: i()),
        ),
        Bind.factory((i) =>
            AssinaturaAlunoProvider(firestore: FirebaseFirestore.instance)),
        Bind.factory((i) => AssinaturaAlunoRepositoryImpl(i())),
        Bind.factory((i) => AssinaturaAlunoServiceImpl(i())),
        Bind.factory((i) => AssinaturaAlunoBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginProfessorPage()),
        ChildRoute('/listar_turmas',
            child: (context, args) => ListarTurmasPage(professor: args.data!, hospitalEmail:args.queryParams['emailHospital']!)),
        ChildRoute('/acao',
            child: (context, args) => AcaoPage(
                  turma: args.data,
                  idProfessor: args.queryParams['idProfessor']!,
                  nomeProfessor: args.queryParams['nomeProfessor']!, emailHospital: args.queryParams['emailHospital']!,
                )),
        ChildRoute('/listar_alunos',
            child: (context, args) => ListarAlunosPage(
                  turma: args.data,
                  acao: args.queryParams['acao']!,
                  idProfessor: args.queryParams['idProfessor']!,
                  nomeProfessor: args.queryParams['nomeProfessor']!,
                  justificativa:args.queryParams['justificativa']!, emailhospital:  args.queryParams['emailHospital']!,
                )),
        ChildRoute('/assinatura_aluno',
            child: (context, args) => AssinaturaAlunoPage(
                  aluno: args.data,
                  turma: args.queryParams['turma']!,
                  status: args.queryParams['status']!,
                )),
        ChildRoute('/assinatura_professor',
            child: (context, args) => AssinaturaProfessorPage(
                  professor: args.queryParams['professor']!,
                )),
      ];
}
