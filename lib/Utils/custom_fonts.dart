import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsCustom {
  static TextStyle dmSans({
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? lineHeight,
    Color? fontColor,
  }) {
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: lineHeight,
      color: fontColor,
    );
  }

  static TextStyle titilliumWeb({
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? lineHeight,
    Color? fontColor,
  }) {
    return GoogleFonts.titilliumWeb(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: lineHeight,
      color: fontColor,
    );
  }
}
