import 'package:flutter/material.dart';
import 'package:flutter_project_async_api/pages/coffee_list_page.dart';
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
      appBar: CustomAppBar(
        titleAppBar: "Página Inicial",
        colorAppBar: Colors.deepPurpleAccent.shade200,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: ButtomAcessList(
                  titleButton: 'Ir para a Lista de Cafés',
                  pageToNavigate: CoffeeListPage()),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: ButtomAcessList(
                  titleButton: 'Ir para a Lista de Cafés',
                  pageToNavigate: CoffeeListPage()),
            ),
          ],
        ),
      ),
    );
  }
}
