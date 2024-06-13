import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/models/CharactersHP.dart';

class ListItems<T> extends StatelessWidget {
  final List<T> items;

  const ListItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index]; // Cast para CharactersHP

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: _buildAvatar(item),
        );
      },
    );
  }

  Widget _buildAvatar(item) {
    if (item is CharactersHP) {
      return ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage((item as dynamic).image),
          radius: 30.0,
        ),
        title: Text(
          (item as dynamic).name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          (item as dynamic).description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16.0,
          ),
        ),
      );
    } else {
      return ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(((item as dynamic).image),
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            )
        ),
        title: Text(
          (item as dynamic).name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          (item as dynamic).description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16.0,
          ),
        ),
      );
    }
  }
}