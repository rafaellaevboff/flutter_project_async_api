import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/constants.dart';
import 'package:flutter_project_async_api/models/BooksHP.dart';
import 'package:flutter_project_async_api/services/busca_api.dart';
import 'package:flutter_project_async_api/themes/colors.dart';
import 'package:flutter_project_async_api/widgets/custom_app_bar.dart';
import 'package:flutter_project_async_api/widgets/list_items.dart';
import 'package:flutter_project_async_api/widgets/search_itens.dart';

class HarryPotterBooksListPage extends StatefulWidget {
  const HarryPotterBooksListPage({super.key});

  @override
  State<HarryPotterBooksListPage> createState() => HarryPotterBooksListPageState();
}

class HarryPotterBooksListPageState extends State<HarryPotterBooksListPage> {
  BuscaApi api = BuscaApi<HarryPotter>((json) => HarryPotter.fromJson(json), urlApi: BASE_URL_BOOKS);
  late List<HarryPotter> _harryPotterBooks;
  late List<HarryPotter> _harryPotterBooksFiltered;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHarryPotters();
  }

  Future<void> _fetchHarryPotters() async {
    _harryPotterBooks = await api.fetchItems() as List<HarryPotter>;
    _harryPotterBooksFiltered = _harryPotterBooks;
    setState(() {
      _isLoading = false;
    });
  }

  void _filterHarryPotters(String filter) {
    setState(() {
      _harryPotterBooksFiltered = _harryPotterBooks
          .where((harryPotter) =>
          harryPotter.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(titleAppBar: "Lista de livros de Harry Potter", colorAppBar: AppColors.primaryColor),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          PesquisarItens(onChanged: _filterHarryPotters),
          Expanded(
            child: ListItems<HarryPotter>(items: _harryPotterBooksFiltered),
          ),
        ],
      ),
    );
  }
}
