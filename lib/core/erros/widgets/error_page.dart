


import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class ErrorTextWidget extends StatelessWidget {
  final String message;
  const ErrorTextWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Center(child: Text(message,style: TextStyle(
      fontSize: size.width*0.03,
      fontWeight: FontWeight.bold,
      color: AppColors.blue

    ),),);
  }
}
