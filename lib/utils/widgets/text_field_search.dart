import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../const.dart';

class TextFieldSearch extends StatelessWidget {
   TextEditingController ?_controller = TextEditingController();

  TextFieldSearch(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
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
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
              hintText: 'search',
              contentPadding: EdgeInsets.only(
                  left: 8, right: 8, top: 5, bottom: 5),
              hintStyle: TextStyle(
                color: kColorGray,
                fontSize: 10.0.sp,
              ),
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              border: InputBorder.none),
        ),
      ),
    );
  }
}