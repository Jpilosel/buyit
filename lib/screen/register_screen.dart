import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:buyit/constants/global_constant.dart';
import 'package:buyit/constants/routes_constants.dart';
import 'package:buyit/screen/components/button_component.dart';
import 'package:buyit/screen/components/textformfield_component.dart';

class RegisterScreen extends StatelessWidget {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white,
                    fontSize: GlobalConstant.getFontSizeTitle(context),
                  ),
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
                    validator: GlobalConstant.emailValidator,
                    onSaved: (emailSaved) => _email = emailSaved.trim(),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: ComponentTextFormField(
                    obscureText: true,
                    controller: _passController,
                    validator: GlobalConstant.passwordValidator,
                    hinText: "Mot de passe",
                    onSaved: (passwordSaved) =>
                        _password = passwordSaved.trim(),
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
                                (route) => false))
                            .catchError((onError) {});
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
