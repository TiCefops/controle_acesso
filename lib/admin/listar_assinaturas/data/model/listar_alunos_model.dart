// To parse this JSON data, do
//
//     final listarAssinaturasModel = listarAssinaturasModelFromJson(jsonString);

import 'package:cefops_controll_acess/admin/listar_assinaturas/data/interface/entity/listar_assinaturas_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ListarAssinaturasModel listarAssinaturasModelFromJson(String str) => ListarAssinaturasModel.fromJson(json.decode(str));

String listarAssinaturasModelToJson(ListarAssinaturasModel data) => json.encode(data.toJson());

class ListarAssinaturasModel extends ListarAssinaturasEntity{
  ListarAssinaturasModel({
    required this.assinatura,
    required this.horaAssinatura,
  }) : super(assinatura, horaAssinatura);

  String assinatura;
  String horaAssinatura;

  factory ListarAssinaturasModel.fromJson(Map<String, dynamic> json) => ListarAssinaturasModel(
    assinatura: json["assinatura"],
    horaAssinatura: json["horaAssinatura"],
  );

  Map<String, dynamic> toJson() => {
    "assinatura": assinatura,
    "horaAssinatura": horaAssinatura,
  };
}
