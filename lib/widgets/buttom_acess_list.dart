import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/styles/custom_button_style.dart';

class ButtomAcessList extends StatelessWidget {
  final String titleButton;
  final Widget pageToNavigate;

  const ButtomAcessList({
    super.key,
    required this.titleButton,
    required this.pageToNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: CustomButtonStyle.customButtonStyle,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageToNavigate),
        );
      },
      child: Text(titleButton),
    );
  }
}
