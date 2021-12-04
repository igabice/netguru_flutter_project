import 'package:flutter/material.dart';
import 'package:flutter_app/values/app_theme.dart';

class CustomLoading extends StatelessWidget {
  CustomLoading({this.bgColor, this.valueColor});

  final Color? valueColor;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: bgColor ?? context.backgroundColor(),
      valueColor: AlwaysStoppedAnimation(valueColor ?? context.primaryColor()),
    );
  }
}
