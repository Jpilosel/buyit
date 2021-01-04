import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart' as validate;
import 'package:google_fonts/google_fonts.dart';

class GlobalConstant {
  static TextStyle getFont1({Color color = Colors.white, double fontSize}) {
    return GoogleFonts.satisfy(color: color, fontSize: fontSize);
  }

  static TextStyle getFont2({Color color = Colors.white, double fontSize}) {
    return GoogleFonts.comfortaa(color: color, fontSize: fontSize);
  }

  static double getFontSizeTitle(BuildContext context) {
    final MediaQueryData _device = MediaQuery.of(context);
    final double _fontSizeTitle = _device.orientation == Orientation.portrait
        ? _device.size.height * 0.10
        : _device.size.height * 0.05;
    return _fontSizeTitle;
  }

  static String emailValidator(String email) {
    if (!validate.isEmail(email)) {
      return "Merci d'entrer une adresse email correcte.";
    }
    return null;
  }

  static String passwordValidator(String password) {
    if (validate.isAlphanumeric(password)) {
      return "Votre mot de passe doit contenier au moins un symbole, des lettres et des chiffres";
    }
    if (password.length < 6) {
      return "Le mot de passe doit contenir au minimum 6 caractères.";
    }
    return null;
  }

  static ThemeData getDarkTheme() {
    return ThemeData.dark().copyWith(
        buttonColor: Colors.orange[600],
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: getFont2(color: Colors.white),
        ));
  }
}
