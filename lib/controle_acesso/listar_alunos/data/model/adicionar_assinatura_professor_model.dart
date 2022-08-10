
import 'dart:convert';

import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/adicionar_assinatura_professor_entity.dart';

AdicionarAssinaturaProfessorModel adicionarAssinaturaProfessorModelFromJson(String str) => AdicionarAssinaturaProfessorModel.fromJson(json.decode(str));

String adicionarAssinaturaProfessorModelToJson(AdicionarAssinaturaProfessorModel data) => json.encode(data.toJson());

class AdicionarAssinaturaProfessorModel  extends AdicionarAssinaturaProfessorEntity{
  AdicionarAssinaturaProfessorModel({
    required this.assinaturaProfessor,
    required this.idProfessor,
    required this.nomeProfessor,
    required this.nomeDisciplina,
    required this.idAluno,
    required this.idAssinaturaAluno,
    required this.justificativa,
  }) : super(assinaturaProfessor, idProfessor, nomeProfessor, nomeDisciplina,idAluno,idAssinaturaAluno,justificativa);

  String assinaturaProfessor;
  String idProfessor;
  String nomeProfessor;
  String nomeDisciplina;
  String idAluno;
  String idAssinaturaAluno;
  String justificativa;

  factory AdicionarAssinaturaProfessorModel.fromJson(Map<String, dynamic> json) => AdicionarAssinaturaProfessorModel(
    assinaturaProfessor: json["assinaturaProfessor"],
    idProfessor: json["idProfessor"],
    nomeProfessor: json["nomeProfessor"],
    nomeDisciplina: json["nomeDisciplina"],
    idAluno: json["idAluno"],
    idAssinaturaAluno: json["idAssinaturaAluno"],
    justificativa: json["justificativa"],
  );

  Map<String, dynamic> toJson() => {
    "assinaturaProfessor": assinaturaProfessor,
    "idProfessor": idProfessor,
    "nomeProfessor": nomeProfessor,
    "nomeDisciplina": nomeDisciplina,
    "idAluno": idAluno,
    "idAssinaturaAluno": idAssinaturaAluno,
    "justificativa": justificativa,
  };
}
