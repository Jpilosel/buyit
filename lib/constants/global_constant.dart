import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart' as validate;

class GlobalConstant {
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
}
