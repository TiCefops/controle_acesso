
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class AssinaturaWidgetUtils extends StatelessWidget {
  final SignatureController controller;
  const AssinaturaWidgetUtils({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 3
        )
      ),
      width: size.width*0.8,

      child: Signature(
        controller: controller,
        height: size.height*0.3,
        width: size.width*0.8,
        backgroundColor: Colors.white,
      ),
    );
  }
}
