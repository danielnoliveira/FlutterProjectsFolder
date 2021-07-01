import 'package:app_ibge_data_consultation/models/countryList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, int> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    return Consumer<CountryList>(builder: (context, countryList, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Detalhamento de País'),
        ),
        body: Column(
          children: [
            Text(
              'Brasil',
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    });
  }
}
