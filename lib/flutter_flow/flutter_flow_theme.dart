import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Extension on ThemeData to add custom properties
extension FlutterFlowThemeExtension on ThemeData {
  Color get primaryBackground => Colors.white;
  Color get secondaryBackground => Color(0xFFF1F4F8);
  Color get primary => FlutterFlowTheme.primary;
  Color get secondary => FlutterFlowTheme.secondary;
  Color get tertiary => FlutterFlowTheme.tertiary;
  Color get alternate => FlutterFlowTheme.alternate;
  Color get primaryText => FlutterFlowTheme.primaryText.color!;
  Color get secondaryText => FlutterFlowTheme.secondaryText.color!;
  Color get white => FlutterFlowTheme.white;
  Color get overlayWhite => FlutterFlowTheme.overlayWhite;

  // Add text styles to ThemeData
  TextStyle get bodyMedium => FlutterFlowTheme.bodyMedium;
  TextStyle get titleMedium => FlutterFlowTheme.titleMedium;
  TextStyle get titleSmall => FlutterFlowTheme.titleSmall;
  TextStyle get headlineSmall => FlutterFlowTheme.headlineSmall;
}

class FlutterFlowTheme {
  // Main method widgets use to access theme
  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }

  // Colors
  static const Color primary = Color(0xFF4B39EF);
  static const Color secondary = Color(0xFFEE8B60);
  static const Color tertiary = Color(0xFFE6E6E6);
  static const Color alternate = Color(0xFF39D2C0);  // Added missing alternate color
  static const Color white = Color(0xFFFFFFFF);
  static const Color lineColor = Color(0xFFE0E3E7);
  static const Color overlayWhite = Color(0xC8FFFFFF);
  static const Color error = Color(0xFFFF5963);
  static const Color success = Color(0xFF95DB9A);
  static const Color warning = Color(0xFFFFD249);
  static const Color info = Color(0xFF9DCEFF);
  
  // Text Styles
  static TextStyle get titleLarge => GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get titleMedium => GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle get titleSmall => GoogleFonts.poppins(
    color: const Color(0xFF1D1D1D),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

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

  static TextStyle get bodySmall => GoogleFonts.poppins(
    color: const Color(0xFF57636C),
    fontSize: 12,
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