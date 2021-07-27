import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  EdgeInsetsGeometry ?padding;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;

    CustomTextWidget(
      {this.title,
      this.color,
      this.size,
      this.fontWeight,
      this.padding,
        this.fontFamily,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? null,
      child: Text(
        title!,
        textAlign: textAlign ?? null,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight ?? null,
          fontSize: size,
          fontFamily:fontFamily == null ? null : fontFamily
        ),
      ),
    );
  }
}
