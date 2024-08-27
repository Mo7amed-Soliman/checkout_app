import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static const double padding = 20.0;
  static const double radius = 12.0;

  AppStyles._();
  static TextStyle myStyles({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static TextStyle interRegular18 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      interSemiBold18 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      interSemiBold24 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      interRegular20 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      interMedium22 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      interMedium25 = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      latoMedium25 = GoogleFonts.lato(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      );
}
