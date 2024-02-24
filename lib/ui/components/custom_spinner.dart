import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../theme/colors.dart';

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    super.key,
    this.size = 12.0,
    this.color = AppColors.whiteColor
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoActivityIndicator(
          radius: size,
          color: color,
        )
      : SizedBox(
          width: 23,
          height: 23,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 2,
          ),
      );
  }
}
