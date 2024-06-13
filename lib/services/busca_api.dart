import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class FromJsonConvertible<T> {
  T fromJson(Map<String, dynamic> json);
}

class BuscaApi<T extends FromJsonConvertible<T>> {
  final dynamic urlApi;

  final T Function(Map<String, dynamic>) create;
  BuscaApi(this.create, {required this.urlApi});

  Future<List<T>> fetchItems() async {
    final response = await http.get(Uri.parse('$urlApi'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => create(item)).toList();
    }

    throw Exception("Erro ao buscar os dados");
  }
}
