import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final bool ?loading;
  final Color ?color;
  final double padding;

  CustomButtonWidget({required this.title,required this.onClick, this.loading, this.color,this.padding = 20});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 46,
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: onClick,
          child: loading != null && loading == true
              ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
              : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
        ),
      ),
    );
  }
}