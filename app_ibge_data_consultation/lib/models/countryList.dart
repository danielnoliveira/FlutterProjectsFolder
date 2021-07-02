import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryList extends ChangeNotifier {
  List<dynamic> _countrys = [];

  List<dynamic> _mutableList = [];

  List<dynamic> get countrys => _mutableList;

  CountryList() {
    populateList();
  }

  void populateList() async {
    var url = Uri.parse('https://servicodados.ibge.gov.br/api/v1/paises/');
    var response = await http
        .get(url, headers: {'Content-Type': 'application/json; charset=utf-8'});

    if (response.statusCode == 200) {
      var result = json.decode(utf8.decode(response.bodyBytes));
      _countrys.addAll(result);
      _mutableList.addAll(result);
    }
    notifyListeners();
  }

  void filterList(String text) {
    List<dynamic> novaLista = _countrys
        .where((element) => (element["nome"]["abreviado"] as String)
            .toLowerCase()
            .contains(text))
        .toList();
    _mutableList = novaLista;
    notifyListeners();
  }

  void deleteCountry(index) {
    var excludedCountryM49 = _mutableList[index]['id']['M49'];
    var novaLista = _countrys
        .where((element) => element['id']['M49'] != excludedCountryM49)
        .toList();
    var novaLista2 = _mutableList
        .where((element) => element['id']['M49'] != excludedCountryM49)
        .toList();
    _countrys = novaLista;
    _mutableList = novaLista2;
    notifyListeners();
  }
}
