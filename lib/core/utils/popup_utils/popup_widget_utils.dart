import 'package:flutter/material.dart';

class PopupWidgetUtils extends StatelessWidget {
  const PopupWidgetUtils({Key? key, required this.content, required this.tituloPop, required this.actions}) : super(key: key);
  final Widget content;
  final String tituloPop;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: AlertDialog(
        title:  Text(tituloPop),
        content: content,
        actions: actions,
      ),
    );
  }
}
