import 'package:flutter/material.dart';

class ComponentErrorDialog extends StatelessWidget {
  final String errorCode;
  ComponentErrorDialog(this.errorCode);

  @override
  Widget build(BuildContext context) {
    String _message = "";

    switch (errorCode) {
      case "ERROR_USER_NOT_FOUND":
      case "ERROR_INVALID_EMAIL":
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
    return SimpleDialog(
      title: Text(
        "Etteur",
        style: TextStyle(color: Colors.red),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_message),
        ),
        FlatButton(
          child: Text("Fermer"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
