import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../const.dart';
import 'custom_text_widget.dart';

class CustomRadioSpace extends StatelessWidget {
  final String title;
  final Function()? click;
  final String? value;
  final String? selected;
  final double? size;
  final Color ?color;

  CustomRadioSpace({required this.title, this.click, this.value, this.selected,this.size,this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            title: title,
            size: size == null ? 13.0.sp : size,
            fontWeight: FontWeight.w600,
            color: color == null ?Color(0xff777777) :color,
          ),
          SizedBox(width: 10),
          selected == value
              ? Container(
            height: 5.w,
            width: 5.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 3.0,
                  ),
                ]),
            child: Icon(CupertinoIcons.checkmark,size: 13.sp,color: kMainColor),
          )
              : Container(
            height: 5.w,
            width: 5.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 4.0,
                  ),
                ]),
          ),

        ],
      ),
    );
  }
}
