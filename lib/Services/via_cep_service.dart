import 'dart:convert';

import 'package:flutter_application_1/Models/endereco_model.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  Future<Endereco> buscarEmdereco(String cep) async {
    Uri uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");

    dynamic response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return Endereco.fromJson(data);
    } else {
      throw Exception("CEP não encontrado");
    }
  }
}
