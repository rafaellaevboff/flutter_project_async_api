import 'package:flutter/material.dart';

class PesquisarItens extends StatelessWidget {
  final Function(String) onChanged;

  const PesquisarItens({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Filtro"),
      ),
    );
  }
}
