import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _getTextStyle({
  required FontWeight fontWeight,
  required Color color,
  double? fontSize = 18,
}) =>
    TextStyle(
      color: color,
      fontFamily: "Somar",
      fontWeight: fontWeight,
      fontSize: fontSize!.sp,
    );

// regular style
TextStyle getRegularStyle({
  required Color color,
  double? fontSize,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );

// bold style
TextStyle getBoldStyle({
  required Color color,
  double? fontSize,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
