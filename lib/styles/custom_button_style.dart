import 'package:flutter/material.dart';

class CustomButtonStyle {
  static final ButtonStyle customButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
        return states.contains(WidgetState.pressed)
            ? Colors.black45
            : Colors.black;
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
        return states.contains(WidgetState.pressed)
            ? Colors.white
            : Colors.white;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
        return states.contains(WidgetState.pressed)
            ? Colors.red.withOpacity(0.2)
            : Colors.red.withOpacity(0.8);
      },
    ),
    shadowColor: WidgetStateProperty.all(Colors.black),
    elevation: WidgetStateProperty.all(5),
  );
}
