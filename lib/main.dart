import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/models/Coffee.dart';
import 'package:flutter_project_async_api/services/coffee_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CoffeesApi api = CoffeesApi();

  late List<Character> _coffees;
  late List<Character> _coffeesFiltered;

  @override
  void initState() {
    super.initState();
    _fetchCoffees();
  }

  Future<List<Character>> _fetchCoffees() async {
    _coffees = await api.fetchCoffees();
    _coffeesFiltered = _coffees;

    return _coffees;
  }

  _filtercoffees(String filter) {
    setState(() {
      _coffeesFiltered = _coffees
          .where((element) =>
              element.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Personagens"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  _filtercoffees(value);
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Filtro"),
              ),
            ),
            FutureBuilder<List<Character>>(
                future: api.fetchCoffees(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_coffeesFiltered[index].name),
                                subtitle:
                                    Text(_coffeesFiltered[index].descricao),
                                leading: Image.network(
                                    _coffeesFiltered[index].image),
                              );
                            },
                            separatorBuilder: (_, __) {
                              return const Divider();
                            },
                            itemCount: _coffeesFiltered.length),
                      ),
                    );
                  }
                  return const Text("Erro");
                }),
          ],
        ),
      ),
    );
  }
}
