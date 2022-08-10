


import 'dart:convert';
import 'dart:io';
import 'package:cefops_controll_acess/core/utils/enviar_email/email_model.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailServices{

  final EmailModel modelo=EmailModel();


  Future<void >enviarEmail({required String turma, required String status,required String filePath,required String emailHospital})async{
    final FirebaseRemoteConfig config=FirebaseRemoteConfig.instance;
    Map<String,dynamic> emailConf=jsonDecode(
      config.getString("email_config"),
    );

    int porta=emailConf["port"];
    String usuario=emailConf["usuario"];
    String password=emailConf["senha"];
    String smtp=emailConf["smtp"];
    String email1=emailConf["email1"];
    String email2=emailConf["email2"];



    final smtpServer = SmtpServer(smtp,
        port:porta ,ssl: true,ignoreBadCertificate:true,username:usuario,password: password);

    final message = Message()
      ..from = Address(usuario, 'EAS Controle Alunos')
      ..recipients.add(emailHospital)
      ..ccRecipients.addAll([ Address(email1), email2])
      ..subject = 'EAS-Lista de Presença $turma'
      ..html = modelo.html(turma: turma,tipo: status)
      ..attachments = [
        FileAttachment(File(filePath))
          ..location = Location.inline
          ..cid = '<myimg@3.141>'
      ];

    try {
      final sendReport = await send(message, smtpServer);

      FirebaseCrashlytics.instance.log("Email da turma $turma enviado com sucesso as ${DateTime.now}");

    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

  }

}