import 'package:cefops_controll_acess/controle_acesso/login_professor/pages/login_professor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Teste de inserir texto", (tester) async {
    await tester.pumpWidget(const MediaQuery(
        data:  MediaQueryData(),
        child:  MaterialApp(home:  LoginProfessorPage())));
    expect ( find.text("Entrar") , findsOneWidget );


  });
}