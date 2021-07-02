import 'package:app_ibge_data_consultation/models/countryList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  final pad = Padding(
    padding: EdgeInsets.all(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Países'),
          centerTitle: true,
        ),
        body: Consumer<CountryList>(builder: (context, countryList, child) {
          return SingleChildScrollView(
              child: Column(children: [
            pad,
            Row(children: [
              pad,
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: 'Nome do país...'),
                onChanged: countryList.filterList,
              )),
              pad
            ]),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: countryList.countrys.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/country',
                              arguments: {'index': index});
                        },
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            '${countryList.countrys[index]["nome"]["abreviado"]}',
                            style: (Theme.of(context).textTheme.headline6)
                                ?.merge(TextStyle(color: Colors.white)),
                          )),
                          CachedNetworkImage(
                              imageUrl:
                                  'https://www.countryflags.io/${countryList.countrys[index]["id"]["ISO-3166-1-ALPHA-2"]}/flat/64.png')
                        ]),
                      ));
                },
                padding: EdgeInsets.all(20))
          ]));
        }));
  }
}
