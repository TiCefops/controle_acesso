import 'dart:async';

import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/services/i_adicionar_assinatura_professor_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/utils/gerador_pdf/pdf_generate.dart';
import '../data/interfaces/services/i_listar_alunos_services.dart';
import '../data/model/adicionar_assinatura_professor_model.dart';
import 'listar_alunos_event.dart';
import 'listar_alunos_state.dart';

class ListarAlunosBloc extends Bloc<ListarAlunosEvent, ListarAlunosState> {
  final IListarAlunosServices service;
  final IAdicionarAssinaturaProfessorService assinaturaProfessorServices;



  ListarAlunosBloc({required this.service, required this.assinaturaProfessorServices})
      : super(ListarAlunosState().init()) {
    on<InitEvent>(_init);
    on<CarregandoEvent>(_carregarDados);
    on<EnviandoEvent>(_enviarDados);
    on<EnviarAssinaturaProfessorEvent>(_enviarAssinaturaProfessor);
    on<ErroEvent>(_error);
    on<ErroSnacBarEvent>(_errorScafold);
  }

  List<Map<String,dynamic>> alunosAssinado = [ ];

  void _init(InitEvent event, Emitter<ListarAlunosState> emit) async {
    emit(state.clone());
  }

  Future _carregarDados(
      CarregandoEvent event, Emitter<ListarAlunosState> emit) async {
    emit(CarregandoState());
    final alunos = await service.listarAlunos(idTurma: event.idTurma);
    if (alunos.isRight) {
      emit(CarregadoState(alunos: alunos.right));
    } else {
      emit(
          ErrorState(message: "Não Encontramos Alunos Cadastrado para turma:"));
    }
  }

  Future _enviarDados(
      EnviandoEvent event, Emitter<ListarAlunosState> emit) async {
    final verificaAluno= alunosAssinado.where((element) => element["idAluno"]==event.aluno.id);
    emit(CarregandoState());
    if(verificaAluno.isEmpty){

      final  aluno= await Modular.to.pushNamed(
          './assinatura_aluno?turma=${event.turma}&status=${event.status}',
          arguments: event.aluno) ;


      if(aluno !=null){
        aluno as Map<String,dynamic>;
        final item= alunosAssinado.where((element) => element["idAluno"]==aluno["idAluno"]);
        if (item.isEmpty) {
          alunosAssinado.add(aluno);
        }
      }
    }else{
      emit(
          ScaffoldErrorState(message: "Aluno: ${event.aluno.nome} já assinou "));

    }
    emit(CarregadoState(alunos: event.alunos,));



  }
  Future _error(
      ErroEvent event, Emitter<ListarAlunosState> emit) async {
    emit(ErrorState(message: event.menssage));
  }

  Future _errorScafold(
      ErroSnacBarEvent event, Emitter<ListarAlunosState> emit) async {
    emit(ScaffoldErrorState(message: event.menssage));
  }


  Future<void> _enviarAssinaturaProfessor(EnviarAssinaturaProfessorEvent event,
      Emitter<ListarAlunosState> emit) async {
      for (var element in alunosAssinado) {
        Map<String,dynamic> dados={
          "assinaturaProfessor":event.assinaturaProfessor,
          "idProfessor":event.professorId,
          "nomeProfessor":event.nomeProfessor,
          "nomeDisciplina":event.turma.disciplina,
          "idAluno":element["idAluno"],
          "idAssinaturaAluno":element["idAssinatura"],
          "justificativa": event.justificativa??"ND",
        };
                  AdicionarAssinaturaProfessorModel model=AdicionarAssinaturaProfessorModel.fromJson(dados);
      await assinaturaProfessorServices.adicionarAssinaturaProfessor(assinatura: model);
      }
      await GeradorPdf().gerarPdf(
          dados:alunosAssinado,
          acao: event.acao,
          turma: event.turma.nome,
          nomeProfessor: event.nomeProfessor,
          assinaturaProfessor: event.assinaturaProfessor, emailHospital: event.emailHospital);
      Modular.to.pop();
     await Future.delayed(const Duration(seconds: 2));
      Modular.to.pop();
      Modular.to.pop();
      alunosAssinado=[];
  }


}
