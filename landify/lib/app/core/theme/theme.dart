import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify/app/core/const/colors.dart';

const ColorScheme darkScheme = ColorScheme(
  primary: dark_primary,
  primaryVariant: dark_onPrimary,
  secondary: dark_secondary,
  secondaryVariant: dark_onSecondary,
  surface: dark_surface,
  background: dark_background,
  error: dark_error,
  onPrimary: dark_onPrimary,
  onSecondary: dark_onSecondary,
  onSurface: dark_onSurface,
  onBackground: dark_onBackground,
  onError: dark_onError,
  brightness: Brightness.dark,
);

const ColorScheme lightScheme = ColorScheme(
  primary: light_primary,
  primaryVariant: light_onPrimary,
  secondary: light_secondary,
  secondaryVariant: light_onSecondary,
  surface: light_surface,
  background: light_background,
  error: light_error,
  onPrimary: light_onPrimary,
  onSecondary: light_onSecondary,
  onSurface: light_onSurface,
  onBackground: light_onBackground,
  onError: light_onError,
  brightness: Brightness.light,
);

TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  ),
  headline2: GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.w700,
  ),
  headline3: GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  ),
  headline4: GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  ),
  headline5: GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  ),
);

ThemeData lightTheme =
    ThemeData(colorScheme: lightScheme, textTheme: textTheme);

ThemeData darkTheme = ThemeData(
  colorScheme: darkScheme,
  textTheme: textTheme,
);
