import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:golden_diet/utils/const.dart';
import 'package:golden_diet/utils/widgets/custom_text_widget.dart';
import 'package:sizer/sizer.dart';

class TextFieldInput extends StatelessWidget {
  final String? hint;
  final bool centerHint;
  final bool enabled;
  final double? height;
  final int? maxLine;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final Function(String) ?onSaved;
  final bool withInitialValue;
  final String? initialValue;
  final String? suffix;

  TextFieldInput(
      {this.hint,
        this.centerHint = false,
        this.enabled = true,
        this.height = 50,
        this.maxLine = 1,
        this.textEditingController,
        this.textInputType = TextInputType.text,
        this.onSaved,
        this.withInitialValue = false,
        this.initialValue,this.suffix=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(.2),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              CustomTextWidget(title:'$suffix',size: 16.0.sp,color: kMainColor),
              Expanded(
                child: TextFormField(
                  initialValue: withInitialValue
                      ? initialValue == 'null'
                      ? ''
                      : initialValue
                      : null,
                  onChanged: onSaved,
                  controller: textEditingController,
                  keyboardType: textInputType,
                  maxLines: maxLine,
                  textAlign: centerHint ? TextAlign.center : TextAlign.start,
                  decoration: InputDecoration(
                      hintText: hint,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      hintStyle: TextStyle(
                        color: Color(0xff96999C),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600
                      ),

                      fillColor: Colors.white,
                      filled: true,
                      enabled: enabled,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
