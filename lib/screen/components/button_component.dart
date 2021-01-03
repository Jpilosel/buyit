import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComponentButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final RoundedLoadingButtonController controller;

  ComponentButton(
      {@required this.buttonName,
      @required this.onPressed,
      @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RoundedLoadingButton(
        color: Colors.orange[600],
        successColor: Colors.orange[500],
        duration: const Duration(seconds: 1),
        child: Text(buttonName, style: TextStyle(color: Colors.white)),
        controller: controller,
        onPressed: onPressed,
      ),
    );
  }
}
