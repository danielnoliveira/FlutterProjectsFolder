import 'package:app_ibge_data_consultation/screens/country.dart';
import 'package:app_ibge_data_consultation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/countryList.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CountryList(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBGE Países Dados',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/country': (context) => CountryScreen()
      },
    );
  }
}
