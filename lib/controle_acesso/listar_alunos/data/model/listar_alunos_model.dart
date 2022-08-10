// To parse this JSON data, do
//
//     final listarAlunosModel = listarAlunosModelFromJson(jsonString);

import 'package:cefops_controll_acess/controle_acesso/listar_alunos/data/interfaces/entity/listar_alunos_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ListarAlunosModel listarAlunosModelFromJson(String str) => ListarAlunosModel.fromJson(json.decode(str));

String listarAlunosModelToJson(ListarAlunosModel data) => json.encode(data.toJson());

class ListarAlunosModel extends ListarAlunosEntity {
  ListarAlunosModel({
    required this.nome,
    required this.id,
    required this.cpf,
    required this.status,
    required this.turmas,
  }) : super(nome, id, cpf, status, turmas);

  String nome;
  String id;
  String cpf;
  bool status;
  List<dynamic> turmas;

  factory ListarAlunosModel.fromJson(Map<String, dynamic> json) => ListarAlunosModel(
    nome: json["nome"],
    id: json["id"],
    cpf: json["cpf"],
    status: json["status"],
    turmas: List<dynamic>.from(json["turmas"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "id": id,
    "cpf": cpf,
    "status": status,
    "turmas": List<dynamic>.from(turmas.map((x) => x)),
  };
}
