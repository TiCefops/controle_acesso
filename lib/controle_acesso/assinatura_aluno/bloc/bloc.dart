import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/interface/services/i_assinatura_aluno_service.dart';
import 'event.dart';
import 'state.dart';

class AssinaturaAlunoBloc
    extends Bloc<AssinaturaAlunoEvent, AssinaturaAlunoState> {
  final IAssinaturaAlunoService service;

  AssinaturaAlunoBloc(this.service) : super(AssinaturaAlunoState().init()) {
    on<InitEvent>(_init);
    on<SendEvent>(_enviarDados);
  }

  void _init(InitEvent event, Emitter<AssinaturaAlunoState> emit) async {
    emit(state.clone());
  }

  Future _enviarDados(
      SendEvent event, Emitter<AssinaturaAlunoState> emit) async {
    String assinaturaId = "error";
    await service
        .assinarChamada(assinatura: event.assinatura)
        .then((value) => assinaturaId = value);

    Map<String, dynamic> aluno = {
      "nome":event.assinatura.nomeAluno,
      "idAluno": event.assinatura.alunoId,
      "idAssinatura": assinaturaId,
      "cpf": event.assinatura.cpf,
      "horaAssinatura":event.assinatura.horaAssinatura,
      "assinaturaAluno":event.assinatura.assinaturaAluno,
    };
    await Future.delayed(const Duration(seconds: 2), () {
      Modular.to.pop();
    });
    Modular.to.pop();
    Modular.to.pop(aluno);
  }
}
