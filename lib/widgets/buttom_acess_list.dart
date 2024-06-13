import 'package:flutter/material.dart';

class ButtomAcessList extends StatelessWidget {
  final String titleButton;
  final Widget pageToNavigate;

  const ButtomAcessList({super.key, required this.titleButton, required this.pageToNavigate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
