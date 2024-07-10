import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/models/CharactersHP.dart';

class ListItems<T> extends StatelessWidget {
  final List<T> items;

  const ListItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index] as CharactersHP; // Cast para CharactersHP

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.image),
              radius: 30.0,
            ),
            title: Text(
              item.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              item.description,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
