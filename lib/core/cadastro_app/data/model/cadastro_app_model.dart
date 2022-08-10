// To parse this JSON data, do
//
//     final cadastroAppModel = cadastroAppModelFromJson(jsonString);

import 'package:cefops_controll_acess/core/cadastro_app/data/interface/entity/cadastro_app_entity.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

CadastroAppModel cadastroAppModelFromJson(String str) => CadastroAppModel.fromJson(json.decode(str));

String cadastroAppModelToJson(CadastroAppModel data) => json.encode(data.toJson());

class CadastroAppModel extends CadastroAppEntity{
  CadastroAppModel({
    required this.email,
    required this.password,
    required this.nomeHospital,
  }) : super(email, password, nomeHospital);

  String email;
  String password;
  String nomeHospital;

  factory CadastroAppModel.fromJson(Map<String, dynamic> json) => CadastroAppModel(
    email: json["email"],
    password: json["password"],
    nomeHospital: json["nomeHospital"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "nomeHospital": nomeHospital,
  };
}
