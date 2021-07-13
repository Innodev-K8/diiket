import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPallete {
  const ColorPallete._();

  static const primaryColor = Color(0xFFFF8527);
  static const secondaryColor = Color(0xFF009EBA);
  static const accentColor = Color(0xFF003046);
  static const darkGray = Color(0xFF636773);
  static const lightGray = Color(0xFFb8b9ba);
  static const blueishGray = Color(0xFFF2F3F4);
  static final backgroundColor = Colors.white;

  static const numberSpinnerColor = Color(0xFFFFB945);

  static const infoColor = Color(0xFF0D6EFD);
  static const successColor = Color(0xFF00B894);

  static const textColor = accentColor;
}

final BoxDecoration kBorderedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  border: Border.all(
    color: ColorPallete.lightGray.withOpacity(0.5),
  ),
);

final kTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -1.5,
    color: ColorPallete.textColor,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: ColorPallete.textColor,
  ),
  headline3: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: ColorPallete.textColor,
  ),
  headline4: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: ColorPallete.textColor,
  ),
  headline5: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: ColorPallete.textColor,
  ),
  headline6: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: ColorPallete.textColor,
  ),
  subtitle1: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: ColorPallete.textColor,
  ),
  subtitle2: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: ColorPallete.textColor,
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: ColorPallete.textColor,
  ),
  bodyText2: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: ColorPallete.textColor,
  ),
  button: GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
    color: Colors.white,
  ),
  caption: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: ColorPallete.lightGray,
  ),
  overline: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: ColorPallete.textColor,
  ),
);
