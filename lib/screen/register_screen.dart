import 'package:buyit/constants/routes_constants.dart';
import 'package:buyit/screen/components/button_component.dart';
import 'package:buyit/screen/components/textformfield_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart' as validate;
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterScreen extends StatelessWidget {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final double _fontSizeTitle = MediaQuery.of(context).size.height * 0.13;
    String _email = "";
    String _password = "";

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
                Container(
                  child: ComponentTextFormField(
                    hinText: "Adresse email",
                    validator: (email) {
                      if (!validate.isEmail(email)) {
                        return "Merci d'entrer une adresse email correcte.";
                      }
                      return null;
                    },
                    onSaved: (emailSaved) {
                      _email = emailSaved.trim();
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: ComponentTextFormField(
                    obscureText: true,
                    controller: _passController,
                    validator: (mdp) {
                      if (validate.isAlphanumeric(mdp)) {
                        return "Votre mot de passe doit contenier au moins un symbole, des lettres et des chiffres";
                      }
                      if (mdp.length < 6) {
                        return "Le mot de passe doit contenir au minimum 6 caractères.";
                      }
                      return null;
                    },
                    hinText: "Mot de passe",
                    onSaved: (passwordSaved) {
                      _password = passwordSaved.trim();
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: ComponentTextFormField(
                    obscureText: true,
                    validator: (confirmMdp) {
                      if (confirmMdp.isEmpty) {
                        return "Merci de confirmer votre mot de passe.";
                      } else if (confirmMdp != _passController.text) {
                        return "Veuillez saisir deux fois le même mot de passe";
                      }
                      return null;
                    },
                    hinText: "Confirmer le mot de passe",
                    onSaved: (value) {},
                  ),
                ),
                SizedBox(height: 10.0),
                ComponentButton(
                  controller: _btnController,
                  buttonName: "S'inscrire",
                  onPressed: () async {
                    try {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _firebase
                            .createUserWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            )
                            .then((_) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesConstants.shop,
                                (route) => false));
                      } else {
                        _btnController.error();
                      }
                    } on StateError catch (error) {
                      print("erreur : $error");
                    }
                  },
                ),
                FlatButton(
                    child: Text("Reset"), onPressed: _btnController.reset),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
