import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.w,
      padding: EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff5F5F60).withOpacity(.2),
            offset: Offset(0.0, 3.0),
            blurRadius: 3.0,
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/images/logo.png',width: 40.w,),
    );
  }
}