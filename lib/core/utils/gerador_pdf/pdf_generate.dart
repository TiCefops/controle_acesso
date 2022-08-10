import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../enviar_email/email_service.dart';

class GeradorPdf {
  Future gerarPdf({
    required List<Map<String, dynamic>> dados,
    required String acao,
    required String nomeProfessor,
    required String assinaturaProfessor,
    required String turma,
    required String emailHospital,
  }) async {
    DateFormat formatoCabecalho = DateFormat('dd-MM-yyyy');
    String formatoCabecalhoData = formatoCabecalho.format(DateTime.now());

    DateFormat formatoRodape = DateFormat('dd/MM/yyyy HH:mm ');
    String formatoRodapeData = formatoRodape.format(DateTime.now());

    final EmailServices sendEmail = EmailServices();

    final targetDir = await getExternalStorageDirectory();
    final targetDirFolder = Directory('${targetDir?.path}/off');

    targetDirFolder.existsSync() ? null : targetDirFolder.create();

    final path = targetDirFolder.path;
    String nomePdf = "${turma}_${acao}_$formatoCabecalhoData";

    final File file = File('$path/$nomePdf.pdf');

    String modeloPdf = "assets/pdf/modeloAs.pdf";
    ByteData bytes = await rootBundle.load(modeloPdf);
    Uint8List pdf =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final PdfDocument document = PdfDocument(inputBytes: pdf);

    final PdfPage page = document.pages[0];

    double top = 200;
    double margin = 50;

    page.graphics.drawString('Lista de Presença $turma',
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: const Rect.fromLTWH(237, 130, 200, 20));

    page.graphics.drawString("${tipo(acao)}    $formatoCabecalhoData",
        PdfStandardFont(PdfFontFamily.helvetica, 16),
        bounds: const Rect.fromLTWH(245, 150, 200, 20));

    int length = dados.length - 1;

    ///Gerar Dynamico
    for (var i = 0; i <= length; i++) {
      if (i == 5) {
        margin = 320;
        top = 200;
      }

      Uint8List assinaturaAlunoDados =
          base64Decode(dados[i]["assinaturaAluno"]);
      PdfBitmap assinaturaAlunoImage = PdfBitmap(assinaturaAlunoDados);

      page.graphics.drawString('Nome: ${dados[i]["nome"]}',
          PdfStandardFont(PdfFontFamily.timesRoman, 12),
          bounds: Rect.fromLTWH(margin, top, 500, 20));

      top = top + 15;
      page.graphics.drawString('CPF: ${dados[i]["cpf"]}',
          PdfStandardFont(PdfFontFamily.timesRoman, 12),
          bounds: Rect.fromLTWH(margin, top, 500, 20));

      top = top + 15;
      page.graphics.drawString(
          'Tipo: ${tipo(acao)}', PdfStandardFont(PdfFontFamily.timesRoman, 12),
          bounds: Rect.fromLTWH(margin, top, 500, 20));

      top = top + 15;
      page.graphics.drawString('Hora: ${dados[i]["horaAssinatura"]}',
          PdfStandardFont(PdfFontFamily.timesRoman, 12),
          bounds: Rect.fromLTWH(margin, top, 500, 20));

      top = top + 20;
      page.graphics.drawString(
          'Assinatura:', PdfStandardFont(PdfFontFamily.timesRoman, 12),
          bounds: Rect.fromLTWH(margin, top, 500, 20));

      page.graphics.drawImage(
          assinaturaAlunoImage, Rect.fromLTWH(margin + 60, top, 110, 20));
      top = top + 30;
    }

    ///Roda pé  data e professor
    page.graphics.drawString('Data: $formatoRodapeData',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),
        bounds: const Rect.fromLTWH(50, 800, 500, 20));

//   final File file2 = File('$path/certificado.pfx');
//
//   PdfSignatureField field = PdfSignatureField(page, 'signature',
//       bounds: Rect.fromLTWH(60, 800, 500, 20),
//       signature: PdfSignature(
//           certificate:
//           PdfCertificate(File(file2.path).readAsBytesSync(), 'cefopsPdf'),
//           contactInfo: 'johndoe@owned.us',
//           locationInfo: 'Honolulu, Hawaii',
//           reason: 'I am author of this document.',
//           digestAlgorithm: DigestAlgorithm.sha256,
//           cryptographicStandard: CryptographicStandard.cms));
//
// //Add a signature field to the form.
//   document.form.fields.add(field);
    final Uint8List imagemAssinaturaProfessorData =
        base64Decode(assinaturaProfessor);
    final PdfBitmap imagemAssinaturaProfessor =
        PdfBitmap(imagemAssinaturaProfessorData);

    page.graphics.drawImage(
        imagemAssinaturaProfessor, const Rect.fromLTWH(350, 770, 180, 15));

    page.graphics.drawString('___________________________________',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),
        bounds: const Rect.fromLTWH(350, 780, 500, 20));

    page.graphics.drawString('Professor: $nomeProfessor',
        PdfStandardFont(PdfFontFamily.timesRoman, 12),
        bounds: const Rect.fromLTWH(370, 800, 500, 20));

 await   File(file.path).writeAsBytes(await document.save());
    document.dispose();
    await removerPermissoes(pdfPath: file.path);
    await sendEmail.enviarEmail(
        turma: turma, status: tipo(acao), filePath: file.path, emailHospital:emailHospital);
  }


  Future<void> removerPermissoes({required String pdfPath}) async {
    final PdfDocument pdfGerado =
        PdfDocument(inputBytes: File(pdfPath).readAsBytesSync());

    PdfSecurity security = pdfGerado.security;
    security.permissions.addAll(<PdfPermissionsFlags>[
      PdfPermissionsFlags.print,
      PdfPermissionsFlags.copyContent,
      PdfPermissionsFlags.fillFields,
      PdfPermissionsFlags.assembleDocument,
      PdfPermissionsFlags.fullQualityPrint
    ]);


    await File(pdfPath).writeAsBytes(await pdfGerado.save());
    pdfGerado.dispose();
  }

  String tipo(String tipo) {
    switch (tipo) {
      case "1":
        return "Entrada";
      case "2":
        return "Saída";
    }
    return "";
  }
}
