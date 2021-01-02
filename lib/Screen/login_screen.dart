import 'package:buyit/constants/routes_constants.dart';
import 'package:buyit/screen/components/button_component.dart';
import 'package:buyit/screen/components/error_dialogComponent.dart';
import 'package:buyit/screen/components/textformfield_component.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:string_validator/string_validator.dart' as validate;
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final double _fontSizeTitle = MediaQuery.of(context).size.height * 0.13;
    String _email;
    String _password;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "BuyIt",
                style: GoogleFonts.satisfy(
                    color: Colors.white, fontSize: _fontSizeTitle),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Tout le Hight-Tech au meilleur prix',
                style: GoogleFonts.comfortaa(),
                textAlign: TextAlign.center,
              ),
              ComponentTextFormField(
                validator: (email) {
                  if (!validate.isEmail(email)) {
                    _btnController.error();
                    return "Merci d'entrer une adresse email valide";
                  }
                  return null;
                },
                hinText: "Adresse email",
                onSaved: (value) => _email = value,
              ),
              SizedBox(height: 10.0),
              ComponentTextFormField(
                obscureText: true,
                validator: (mdp) {
                  if (mdp.length < 6) {
                    _btnController.error();
                    return "Veuillez saisir un mot de passe avec un minimum de 6 caratères";
                  } else if (validate.isAlphanumeric(mdp)) {
                    return "Votre mot de passe doit contenier au moins un symbole, des lettres et des chiffres";
                  }
                  return null;
                },
                hinText: "Mot de passe",
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 20.0),
              ComponentButton(
                buttonName: "Se connecter",
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _btnController.success();
                    _formKey.currentState.save();
                    UserCredential user = await _firebase
                        .signInWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        )
                        .then(
                          (_) => Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesConstants.shop,
                            (route) => false,
                          ),
                        )
                        .catchError((error) {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              ComponentErrorDialog(error.code));
                    });
                  }
                },
                controller: _btnController,
              ),
              FlatButton(child: Text("Reset"), onPressed: _btnController.reset),
            ],
          ),
        ),
      ),
    ));
  }
}
