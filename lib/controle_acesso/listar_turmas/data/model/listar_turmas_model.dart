// To parse this JSON data, do
//
//     final listarTurmasModelImpl = listarTurmasModelImplFromJson(jsonString);

import 'package:cefops_controll_acess/controle_acesso/listar_turmas/data/interface/model/i_listar_turmas_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ListarTurmasModelImpl listarTurmasModelImplFromJson(String str) =>
    ListarTurmasModelImpl.fromJson(json.decode(str));

String listarTurmasModelImplToJson(ListarTurmasModelImpl data) =>
    json.encode(data.toJson());

class ListarTurmasModelImpl extends ListarTurmasEntity {
  ListarTurmasModelImpl({
    required this.nome,
    required this.id,
    required this.status,
    required this.horaEntrada,
    required this.horaSaida,
    required this.dataInicio,
    required this.dataFim,
    required this.disciplina,
  }) : super(nome, id, status, horaEntrada, horaSaida, dataInicio, dataFim,
            disciplina);

  String nome;
  String id;
  String horaEntrada;
  String horaSaida;
  String dataInicio;
  String dataFim;
  String disciplina;

  bool status;

  factory ListarTurmasModelImpl.fromJson(Map<String, dynamic> json) =>
      ListarTurmasModelImpl(
        nome: json["nome"],
        id: json["id"],
        status: json["status"],
        horaSaida: json["horaSaida"],
        horaEntrada: json["horaEntrada"],
        dataFim: json["dataFim"],
        dataInicio: json["dataInicio"],
        disciplina: json["disciplina"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "id": id,
        "status": status,
        "horaEntrada": horaEntrada,
        "horaSaida": horaSaida,
        "dataInicio": dataInicio,
        "dataFim": dataFim,
        "disciplina": disciplina,
      };
}
