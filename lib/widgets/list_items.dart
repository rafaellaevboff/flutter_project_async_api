import 'package:flutter/material.dart';

class ListItems<T> extends StatelessWidget {
  final List<T> items;

  const ListItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text("Nenhum item encontrado"));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          T item = items[index];
          return ListTile(
            title: Text((item as dynamic).name),
            subtitle: Text((item as dynamic).description),
            leading: Image.network((item as dynamic).image),
          );
        },
        separatorBuilder: (_, __) {
          return const Divider();
        },
        itemCount: items.length,
      ),
    );
  }
}
