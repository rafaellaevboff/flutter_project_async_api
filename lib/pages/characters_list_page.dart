import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/constants.dart';
import 'package:flutter_project_async_api/models/CharactersHP.dart';
import 'package:flutter_project_async_api/services/busca_api.dart';
import 'package:flutter_project_async_api/themes/colors.dart';
import 'package:flutter_project_async_api/widgets/custom_app_bar.dart';
import 'package:flutter_project_async_api/widgets/list_items.dart';
import 'package:flutter_project_async_api/widgets/search_itens.dart';

class CharactersHPListPage extends StatefulWidget {
  const CharactersHPListPage({super.key});

  @override
  CharactersHPListPageState createState() => CharactersHPListPageState();
}

class CharactersHPListPageState extends State<CharactersHPListPage> {
  BuscaApi api = BuscaApi<CharactersHP>((json) => CharactersHP.fromJson(json),
      urlApi: BASE_URL_CHARACTERS);
  late List<CharactersHP> _characters;
  late List<CharactersHP> _charactersFiltered;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    _characters = await api.fetchItems() as List<CharactersHP>;
    _charactersFiltered = _characters;
    setState(() {
      _isLoading = false;
    });
  }

  void _filterCharacters(String filter) {
    setState(() {
      _charactersFiltered = _characters
          .where((charactersHP) =>
              charactersHP.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
          titleAppBar: "Lista de Personagens de Harry Potter",
          colorAppBar: AppColors.black,
          colorText: Colors.white),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                PesquisarItens(onChanged: _filterCharacters),
                Expanded(
                  child: ListItems<CharactersHP>(items: _charactersFiltered),
                ),
              ],
            ),
    );
  }
}
