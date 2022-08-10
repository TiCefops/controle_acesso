

import 'package:cefops_controll_acess/controle_acesso/assinatura_aluno/data/interface/entity/assinatura_aluno_enity.dart';

import 'dart:convert';

AssinaturaAlunoModel assinaturaAlunoModelFromJson(String str) => AssinaturaAlunoModel.fromJson(json.decode(str));

String assinaturaAlunoModelToJson(AssinaturaAlunoModel data) => json.encode(data.toJson());

class AssinaturaAlunoModel extends AssinaturaAlunoEntity {
  AssinaturaAlunoModel({
   required this.alunoId,
   required this.hospitalId,
   required this.horaAssinatura,
   required this.tipoEntrada,
   required this.assinaturaAluno,
    required this.hospitalNome,
    required this.cpf,
    required this.nomeAluno

  }) : super(alunoId, hospitalId,hospitalNome, horaAssinatura, tipoEntrada, assinaturaAluno,cpf,nomeAluno);

  @override
  String alunoId;
  @override
  String hospitalId;
  @override
  String horaAssinatura;
  @override
  String tipoEntrada;
  @override
  String assinaturaAluno;
  @override
  String hospitalNome;
  String cpf;
  String nomeAluno;


  factory AssinaturaAlunoModel.fromJson(Map<String, dynamic> json) => AssinaturaAlunoModel(
    alunoId: json["alunoId"],
    hospitalId: json["hospitalId"],
    horaAssinatura: json["horaAssinatura"],
    tipoEntrada: json["tipoEntrada"],
    assinaturaAluno: json["assinaturaAluno"],
    hospitalNome: json["hospitalNome"],
    cpf: json["cpf"], nomeAluno: json["nomeAluno"],
  );

  Map<String, dynamic> toJson() => {
    "alunoId": alunoId,
    "hospitalId": hospitalId,
    "horaAssinatura": horaAssinatura,
    "tipoEntrada": tipoEntrada,
    "assinaturaAluno": assinaturaAluno,
    "hospitalNome": hospitalNome,
    "cpf": cpf,
    "nomeAluno": nomeAluno,
  };
}
