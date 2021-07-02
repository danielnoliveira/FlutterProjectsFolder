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

  void EditCountry(String key, String newValue, int index) {
    var idx1 = _countrys.indexWhere((element) => element['id']['M49'] == index);
    switch (key) {
      case 'nome':
        _countrys[idx1]['nome']['abreviado'] = newValue;
        break;
      case 'capital':
        _countrys[idx1]['governo']['capital']['nome'] = newValue;
        break;
      case 'area':
        _countrys[idx1]['area']['total'] = newValue;
        break;
      case 'regiao':
        _countrys[idx1]['localizacao']['regiao']['nome'] = newValue;
        break;
      case 'sub-regiao':
        _countrys[idx1]['localizacao']['sub-regiao']['nome'] = newValue;
        break;
      case 'regiao-intermediaria':
        _countrys[idx1]['localizacao']['regiao-intermediaria']['nome'] =
            newValue;
        break;
      case 'add-item-linguas':
        _countrys[idx1]['linguas'].add({'nome': newValue});
        break;
      case 'add-item-coins':
        _countrys[idx1]['unidades-monetarias'].add({'nome': newValue});
        break;
      case 'remove-item-coins':
        (_countrys[idx1]['unidades-monetarias'] as List)
            .removeAt(int.parse(newValue));
        break;
      case 'remove-item-linguas':
        (_countrys[idx1]['linguas'] as List).removeAt(int.parse(newValue));
        break;
      case 'historia':
        _countrys[idx1]['historico'] = newValue;
        break;
      default:
    }
    notifyListeners();
  }
}
