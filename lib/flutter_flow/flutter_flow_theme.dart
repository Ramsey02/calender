import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterFlowTheme {
  
  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }

  static const Color primary = Color(0xFF4B39EF);
  static const Color secondary = Color(0xFFEE8B60);
  static const Color tertiary = Color(0xFFE6E6E6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lineColor = Color(0xFFE0E3E7);
  static const Color overlayWhite = Color(0xC8FFFFFF);
  
  static TextStyle get headlineSmall => GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
    color: const Color(0xFF57636C),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get secondaryText => GoogleFonts.poppins(
    color: const Color(0xFF95A1AC),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get primaryText => GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) {
    return copyWith(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }
}