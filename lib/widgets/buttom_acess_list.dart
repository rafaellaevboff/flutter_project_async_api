import 'package:flutter/material.dart';

class ButtomAcessList extends StatelessWidget {
  final String titleButton;
  final Widget pageToNavigate;

  const ButtomAcessList({super.key, required this.titleButton, required this.pageToNavigate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black45; // Cor quando o botão é pressionado
            }
            return Colors.black; // Cor de fundo do botão
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white; // Cor do texto quando o botão é pressionado
            }
            return Colors.white; // Cor do texto
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red.withOpacity(0.2); // Cor de overlay quando pressionado
            }
            return Colors.red.withOpacity(0.8); // Use a cor padrão de overlay
          },
        ),
        shadowColor: MaterialStateProperty.all(Colors.black),
        elevation: MaterialStateProperty.all(5),
      ),
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
