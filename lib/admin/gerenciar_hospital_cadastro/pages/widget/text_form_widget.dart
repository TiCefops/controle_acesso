import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class  TextFormWidget extends StatelessWidget {
  const  TextFormWidget({Key? key, required this.hintText, required this.controller, required this.keyBoardTayp}) : super(key: key);
final String hintText;
final TextEditingController controller;
final TextInputType keyBoardTayp;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardTayp,
      controller: controller,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 3,
            )),
        hintText: hintText,
      ),
    );
  }
}
