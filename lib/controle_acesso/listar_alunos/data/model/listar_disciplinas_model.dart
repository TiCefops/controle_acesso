
// To parse this JSON data, do
//
//     final listarDisciplinasModel = listarDisciplinasModelFromJson(jsonString);

import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_disciplinas_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ListarDisciplinasModel listarDisciplinasModelFromJson(String str) => ListarDisciplinasModel.fromJson(json.decode(str));

String listarDisciplinasModelToJson(ListarDisciplinasModel data) => json.encode(data.toJson());

class ListarDisciplinasModel extends ListarDisciplinasEntity{
  ListarDisciplinasModel({
    required this.andar,
    required this.id,
    required this.maxAluno,
    required this.nome,
    required this.status,
  }) : super(andar, id, maxAluno, nome, status);

  String andar;
  String id;
  String maxAluno;
  String nome;
  bool status;

  factory ListarDisciplinasModel.fromJson(Map<String, dynamic> json) => ListarDisciplinasModel(
    andar: json["andar"],
    id: json["id"],
    maxAluno: json["maxAluno"],
    nome: json["nome"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "andar": andar,
    "id": id,
    "maxAluno": maxAluno,
    "nome": nome,
    "status": status,
  };
}
