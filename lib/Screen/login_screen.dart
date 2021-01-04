import 'package:flutter/material.dart';

import 'package:buyit/screen/components/error_snacbar_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:buyit/constants/routes_constants.dart';
import 'package:buyit/screen/components/button_component.dart';
import 'package:buyit/screen/components/textformfield_component.dart';
import 'package:buyit/constants/global_constant.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final GlobalKey<ScaffoldState> _scaffoldK = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    return Scaffold(
        key: _scaffoldK,
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
                  ComponentTextFormField(
                    validator: GlobalConstant.emailValidator,
                    hinText: "Adresse email",
                    onSaved: (value) => _email = value,
                  ),
                  SizedBox(height: 10.0),
                  ComponentTextFormField(
                    obscureText: true,
                    validator: GlobalConstant.passwordValidator,
                    hinText: "Mot de passe",
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(height: 20.0),
                  ComponentButton(
                    onReset: () {
                      FocusScope.of(context).unfocus();
                    },
                    buttonName: "Se connecter",
                    onPressed: () async {
                      FocusScope.of(context).unfocus(); // ferme me clavier
                      if (_formKey.currentState.validate()) {
                        _btnController.success();
                        _formKey.currentState.save();
                        UserCredential user = await _firebase
                            .signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            )
                            .then((value) {
                              return _btnController.success();
                            })
                            .then(
                              (_) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesConstants.shop,
                                (route) => false,
                              ),
                            )
                            .catchError((error) {
                              _btnController.error();
                              _scaffoldK.currentState.showSnackBar(
                                  ComponentErrorSnacBar(error.code).build());
                            });
                      }
                      _btnController.error();
                    },
                    controller: _btnController,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
