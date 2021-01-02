import 'package:flutter/material.dart';

class ComponentTextFormField extends StatelessWidget {
  final String hinText;
  final void Function(String) onSaved;
  final void Function(String) validator;
  final TextEditingController controller;
  final bool obscureText;

  ComponentTextFormField({
    @required this.hinText,
    @required this.onSaved,
    this.validator,
    this.controller,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller ?? null,
        validator: validator ?? null,
        onSaved: onSaved,
        decoration: InputDecoration(
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(width: 2.0, color: Colors.redAccent[700]),
          //   borderRadius: BorderRadius.circular(32.0),
          // ),
          // errorStyle: TextStyle(color: Colors.redAccent[700]),
          // errorMaxLines: 2,
          // contentPadding: EdgeInsets.symmetric(
          //   horizontal: 20.0,
          //   vertical: 10.0,
          // ),
          hintText: hinText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0)),
          // hintStyle: TextStyle(color: Colors.black),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(width: 2.5, color: Colors.lightBlueAccent),
          //   borderRadius: BorderRadius.circular(32.0),
          // ),
        ),
      ),
    );
  }
}
