import 'package:flutter/material.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class ComponentButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final RoundedLoadingButtonController controller;
  final VoidCallback onReset;

  ComponentButton(
      {@required this.buttonName,
      @required this.onPressed,
      @required this.controller,
      this.onReset});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedLoadingButton(
            color: Theme.of(context).buttonColor,
            duration: const Duration(seconds: 1),
            child: Text(buttonName, style: TextStyle(color: Colors.white)),
            controller: controller,
            onPressed: onPressed,
          ),
          Flexible(
            child: FlatButton(
              onPressed: () {
                if (onReset != null) {
                  onReset();
                } else {
                  controller.reset();
                }
              },
              child: Text("Reset"),
            ),
          ),
        ],
      ),
    );
  }
}
