import 'package:app_ibge_data_consultation/models/countryList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  TextStyle buttonStyle = TextStyle();
  @override
  Widget build(BuildContext context) {
    return Consumer<CountryList>(
      builder: (context, countryList, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: ListView.builder(
                itemCount: countryList.countrys.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/country',
                              arguments: {'index': index});
                        },
                        child: Text(
                            '${countryList.countrys[index]["nome"]["abreviado"]}')),
                  );
                },
                padding: EdgeInsets.all(20)));
      },
    );
  }
}
