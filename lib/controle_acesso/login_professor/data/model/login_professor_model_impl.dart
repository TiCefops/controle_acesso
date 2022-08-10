// To parse this JSON data, do
//
//     final loginProfessorModelImpl = loginProfessorModelImplFromJson(jsonString);


import 'dart:convert';
import '../interfaces/model/login_professor_entity.dart';
LoginProfessorModelImpl loginProfessorModelImplFromJson(String str) => LoginProfessorModelImpl.fromJson(json.decode(str));

String loginProfessorModelImplToJson(LoginProfessorModelImpl data) => json.encode(data.toJson());

class LoginProfessorModelImpl extends LoginProfessorEntity{
  LoginProfessorModelImpl({
    required this.nome,
    required this.cpf,
    required this.id,
    required this.idProfessorReferencia
  }) : super(nome, cpf,id,idProfessorReferencia);

  String nome;
  String cpf;
  String id;
  String idProfessorReferencia;

  factory LoginProfessorModelImpl.fromJson(Map<String, dynamic> json) => LoginProfessorModelImpl(
    nome: json["nome"],
    cpf: json["cpf"],
    id:json["id"],
    idProfessorReferencia:json["idProfessorReferencia"],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "cpf": cpf,
    "idProfessorReferencia":idProfessorReferencia
  };
}
