import 'package:flutter/material.dart';

class ComponentErrorSnacBar {
  final String errorCode;

  ComponentErrorSnacBar(this.errorCode);

  SnackBar build() {
    String _message = "";

    switch (errorCode) {
      case "user-not-found":
      case "invalid-email":
      case "ERROR_WRONG_PASSWORD":
        _message = "Vos identifiants sont incorrects.";
        break;
      case "ERROR_USER_DISABLED":
        _message = "Votre compte est innactif.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        _message =
            "Trop de tentative erronés. Veuillez réessayer dans quelques minutes.";
        break;
      default:
        _message = "Erreur systeme, veuillez contacter le service client";
        break;
    }
    return SnackBar(
      duration: Duration(seconds: 5),
      content: Text(_message),
    );
  }
}
