import 'dart:convert';

import 'package:app_ibge_data_consultation/models/countryList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, int> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    return Consumer<CountryList>(builder: (context, countryList, child) {
      var country = countryList.countrys[args['index'] as int];
      var linguas = country['linguas'] as List;
      var moedas = country['unidades-monetarias'] as List;
      const Padding pad = Padding(
        padding: EdgeInsets.all(10),
      );
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Detalhes do País'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Deletar país'),
                            content: const Text(
                                'Você deseja deletar esse país da lista?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                  Navigator.pop(context);
                                  countryList
                                      .deleteCountry(args['index'] as int);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          )),
                  child: Icon(
                    Icons.delete_forever,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    pad,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${country['nome']['abreviado']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    pad,
                    CachedNetworkImage(
                        imageUrl:
                            'https://www.countryflags.io/${country["id"]["ISO-3166-1-ALPHA-2"]}/flat/64.png'),
                    pad,
                    Row(
                      children: [
                        Text(
                          'Capital: ${country['governo']['capital']['nome']}',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    pad,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Area: ${country['area']['total']} ${country['area']['unidade']['símbolo']}',
                          style: Theme.of(context).textTheme.headline6,
                        ))
                      ],
                    ),
                    pad,
                    Row(
                      children: [
                        Text(
                          'Região: ${country['localizacao']['regiao']['nome']}',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          (country['localizacao']['sub-regiao'] != null)
                              ? 'Sub-região: ${country['localizacao']['sub-regiao']['nome']}'
                              : '',
                          style: Theme.of(context).textTheme.headline6,
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          (country['localizacao']['regiao-intermediaria'] !=
                                  null)
                              ? 'Região intermediaria: ${country['localizacao']['regiao-intermediaria']['nome']}'
                              : '',
                          style: Theme.of(context).textTheme.headline6,
                        ))
                      ],
                    ),
                    pad,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Linguas:',
                                style: Theme.of(context).textTheme.headline6))
                      ],
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: linguas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '* ${linguas[index]['nome']}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          );
                        }),
                    pad,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Unidades monetarias:',
                                style: Theme.of(context).textTheme.headline6))
                      ],
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: moedas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '* ${moedas[index]['nome']}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          );
                        }),
                    pad,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Historia:',
                                style: Theme.of(context).textTheme.headline6))
                      ],
                    ),
                    pad,
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          '${country['historico']}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ))
                      ],
                    ),
                    pad,
                  ],
                ),
              )));
    });
  }
}
