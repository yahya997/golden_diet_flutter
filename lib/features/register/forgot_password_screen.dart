import 'package:flutter/material.dart';
import 'package:golden_diet/utils/widgets/button_back_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id ='ForgotPasswordScreen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(height: 20),
              ButtonBackWidget(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
