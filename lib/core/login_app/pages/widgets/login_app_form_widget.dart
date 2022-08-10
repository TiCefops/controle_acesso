

import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class LoginAppFormWidget extends StatelessWidget {
  const LoginAppFormWidget(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 3)),
        hintText: hintText,
      ),
      validator: (value){
        if(value==null || value.isEmpty){
          return "Preecncha o campo";
        }
        return null;
      },
    );
  }
}
