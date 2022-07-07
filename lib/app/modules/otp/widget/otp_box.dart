import 'package:flutter/material.dart';
import 'package:xyz/services/responsiveSize.dart';

Widget otpBoxWidget(context) {
  return SizedBox(
    width: 48.kh,
    height: 48.kh,
    child: Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
          autofocus: false,
          maxLength: 1,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            fillColor: Color.fromRGBO(0, 0, 0, 0.24),
            // hintText: 'Mobile Number',
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.only(left: 15.kw, bottom: 14.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.28)),
              borderRadius: BorderRadius.circular(10.kh),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 255, 255, 0.28)),
              borderRadius: BorderRadius.circular(10.kh),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }),
    ),
  );
}
