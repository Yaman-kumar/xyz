import 'package:flutter/material.dart';
import 'colors.dart';
import 'responsiveSize.dart';

class TextStyleUtil {
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  TextStyleUtil({
    this.color = ColorUtil.kPrimaryWhite,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w600,
  });

  static TextStyle textMontserratStyleS14W700CWhite({
    //NimbusSanL
    Color color = ColorUtil.kPrimaryWhite,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.kh,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-Regular',
    );
  }

  static TextStyle textMontserratStyleS14WNormalCBlack({
    //NimbusSanL
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.kh,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-Regular',
    );
  }

  static TextStyle textMontserratStyleS17W700CWhite({
    //NimbusSanL
    Color color = ColorUtil.kPrimaryWhite,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      color: color,
      fontSize: 17.kh,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-Regular',
    );
  }

  static TextStyle textMontserratStyleS17W700CPurple({
    Color color = ColorUtil.primary_purple_1,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      color: color,
      fontSize: 24.kw,
      letterSpacing: 0.8,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-SemiBold',
    );
  }

  static TextStyle textMontserratStyleS17W700CBlack({
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat-Bold',
      fontSize: 17.kh,
    );
  }

  static TextStyle textMontserratStyleS17W600CBlack({
    //NimbusSanL
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-SemiBold',
      fontSize: 17.kh,
    );
  }

  static TextStyle textMontserratStyleS20W600CBlack({
    //NimbusSanL
    double fontSize = 20,
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'Montserrat-SemiBold',
      fontSize: fontSize.kh,
    );
  }

  static TextStyle textMontserratStyleS12WNormalCBlack({
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: 12.kh,
      fontFamily: 'Montserrat-Regular',
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle textMontserratStyleS12WNormalCGrey({
    double fontSize = 12,
    Color color = ColorUtil.secondary_grey_1,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Montserrat-Regular',
      color: color,
    );
  }

  static TextStyle textMontserratStyleS14WSemiBoldCBlack({
    Color color = ColorUtil.kPrimaryBlack,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      fontSize: 14.kh,
      fontFamily: 'Montserrat-SemiBold',
      color: ColorUtil.kPrimaryBlack,
    );
  }

  static TextStyle textMontserratStyleS14W700CDark_grey({
    Color color = ColorUtil.dark_grey,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
        fontSize: 14.kh,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat-Bold',
        color: color);
  }

  static TextStyle textMontserratStyleS14W400Csecondary_grey_1({
    Color color = ColorUtil.secondary_grey_1,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
        fontSize: 14.kh,
        fontWeight: fontWeight,
        fontFamily: 'Montserrat-Regular',
        color: color);
  }

  static TextStyle textMontserratStyleS14W400CDark_grey({
    Color color = ColorUtil.dark_grey,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
        fontSize: 14.kh,
        fontWeight: fontWeight,
        fontFamily: 'Montserrat-Regular',
        color: color);
  }

  static TextStyle textMontserratStyleS14W400CDark_orangeAllayya({
    Color color = ColorUtil.secondary_orange_allayya,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
        fontSize: 33.kh,
        fontWeight: fontWeight,
        fontFamily: 'Montserrat-Regular',
        color: color);
  }
}
