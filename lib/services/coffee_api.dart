import 'dart:convert';

import 'package:flutter_project_async_api/constants.dart';
import 'package:flutter_project_async_api/models/Coffee.dart';
import 'package:http/http.dart' as http;

class CoffeesApi {
  Future<List<Character>> fetchCoffees() async {
    final response = await http.get(Uri.parse('$BASE_URL/hot'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => Character.fromJson(item)).toList();
    }

    throw Exception("Erro ao buscar os personagens");
  }
}
