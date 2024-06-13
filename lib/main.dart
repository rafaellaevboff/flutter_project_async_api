import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/pages/characters_list_page.dart';
import 'package:flutter_project_async_api/pages/harry_potter_books_list_page.dart';
import 'package:flutter_project_async_api/themes/colors.dart';
import 'package:flutter_project_async_api/widgets/buttom_acess_list.dart';
import 'package:flutter_project_async_api/widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleAppBar: "Página Inicial",
        colorAppBar: AppColors.primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2021/02/23/09/51/harrypotter-6042940_1280.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: ButtomAcessList(
                      titleButton: 'Livros de HP',
                      pageToNavigate: HarryPotterBooksListPage()),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: ButtomAcessList(
                      titleButton: 'Personagens de HP',
                      pageToNavigate: CharactersHPListPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
