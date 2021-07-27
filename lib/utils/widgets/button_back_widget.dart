import 'package:flutter/material.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.arrow_forward_ios)),
    );
  }
}
