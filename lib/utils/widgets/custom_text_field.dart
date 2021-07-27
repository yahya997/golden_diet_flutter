import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golden_diet/utils/const.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? textEditingController;
  String? labelText;
  IconData? prefixIcon;
  TextInputType? keyboardType;
  bool? password;
  String? suffixIcon;

  CustomTextField(
      {this.textEditingController,
      this.labelText,
      this.prefixIcon,
      this.keyboardType,
      this.suffixIcon,
      this.password});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(top: 20),
      child: new TextFormField(
        inputFormatters: [
          widget.keyboardType == TextInputType.phone
              ? LengthLimitingTextInputFormatter(10)
              : LengthLimitingTextInputFormatter(50)
        ],
        controller: widget.textEditingController,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          suffixIcon: widget.password == true
              ? GestureDetector(
                  onTap: _toggle, child: Icon(Icons.remove_red_eye))
              : widget.suffixIcon == null
                  ? null
                  : Image.asset(
                      widget.suffixIcon!),
          labelText: widget.labelText,
          prefixIcon:
              widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
          labelStyle: new TextStyle(fontSize: 12),
          hoverColor: kMainColor,
          focusColor: kMainColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: kMainColor),
          ),
        ),
        showCursor: true,
        keyboardType: widget.keyboardType,
        obscureText: widget.password == true ? _obscureText : false,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
