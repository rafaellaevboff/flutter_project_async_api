import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/models/Coffee.dart';
import 'package:flutter_project_async_api/services/coffee_api.dart';
import 'package:flutter_project_async_api/widgets/custom_app_bar.dart';
import 'package:flutter_project_async_api/widgets/list_items.dart';
import 'package:flutter_project_async_api/widgets/search_itens.dart';

class CoffeeListPage extends StatefulWidget {
  const CoffeeListPage({super.key});

  @override
  CoffeeListPageState createState() => CoffeeListPageState();
}

class CoffeeListPageState extends State<CoffeeListPage> {
  CoffeesApi api = CoffeesApi();
  late List<Coffee> _coffees;
  late List<Coffee> _coffeesFiltered;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoffees();
  }

  Future<void> _fetchCoffees() async {
    _coffees = await api.fetchCoffees();
    _coffeesFiltered = _coffees;
    setState(() {
      _isLoading = false;
    });
  }

  void _filterCoffees(String filter) {
    setState(() {
      _coffeesFiltered = _coffees
          .where((coffee) =>
              coffee.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: const CustomAppBar(titleAppBar: "Lista de Cafés", colorAppBar: Colors.brown),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                PesquisarItens(onChanged: _filterCoffees),
                Expanded(
                  child: ListItems<Coffee>(items: _coffeesFiltered),
                ),
              ],
            ),
    );
  }
}
