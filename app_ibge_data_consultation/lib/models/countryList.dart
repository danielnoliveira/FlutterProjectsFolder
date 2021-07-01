import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryList extends ChangeNotifier {
  List<dynamic> _countrys = [];

  List<dynamic> get countrys => _countrys;

  CountryList() {
    populateList();
  }

  void populateList() async {
    var url = Uri.parse('https://servicodados.ibge.gov.br/api/v1/paises/');
    var response = await http
        .get(url, headers: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.statusCode == 200) {
      countrys.addAll(jsonDecode(response.body) as List);
    }
    notifyListeners();
  }
}
