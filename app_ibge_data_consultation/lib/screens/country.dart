import 'package:app_ibge_data_consultation/models/countryList.dart';
import 'package:app_ibge_data_consultation/widgets/HistoryCountry.dart';
import 'package:app_ibge_data_consultation/widgets/ListInfoCountry.dart';
import 'package:app_ibge_data_consultation/widgets/NameCountry.dart';
import 'package:app_ibge_data_consultation/widgets/SubInfoCountry.dart';
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
                    NameCountry(
                        country['nome']['abreviado'],
                        (String newValue) => countryList.EditCountry(
                            'nome', newValue, country['id']['M49'])),
                    pad,
                    CachedNetworkImage(
                        imageUrl:
                            'https://www.countryflags.io/${country["id"]["ISO-3166-1-ALPHA-2"]}/flat/64.png'),
                    pad,
                    SubInfoCountry(
                        'Capital: ',
                        country['governo']['capital']['nome'],
                        (String newValue) => countryList.EditCountry(
                            'capital', newValue, country['id']['M49'])),
                    pad,
                    SubInfoCountry(
                        'Área total: ',
                        country['area']['total'],
                        (String newValue) => countryList.EditCountry(
                            'area', newValue, country['id']['M49'])),
                    pad,
                    SubInfoCountry(
                        'Região: ',
                        country['localizacao']['regiao']['nome'],
                        (String newValue) => countryList.EditCountry(
                            'area', newValue, country['id']['M49'])),
                    pad,
                    (country['localizacao']['sub-regiao'] != null)
                        ? SubInfoCountry(
                            'Sub-região: ',
                            country['localizacao']['sub-regiao']['nome'],
                            (String newValue) => countryList.EditCountry(
                                'sub-regiao', newValue, country['id']['M49']))
                        : Text(''),
                    pad,
                    (country['localizacao']['regiao-intermediaria'] != null)
                        ? SubInfoCountry(
                            'Região intermediaria: ',
                            country['localizacao']['regiao-intermediaria']
                                ['nome'],
                            (String newValue) => countryList.EditCountry(
                                'egiao-intermediaria',
                                newValue,
                                country['id']['M49']))
                        : Text(''),
                    pad,
                    ListInfoCountry(
                        country['linguas'],
                        'Linguas:',
                        (String newValue) => countryList.EditCountry(
                            'add-item-linguas', newValue, country['id']['M49']),
                        (String indexList) => countryList.EditCountry(
                            'remove-item-linguas',
                            indexList,
                            country['id']['M49'])),
                    pad,
                    ListInfoCountry(
                        country['unidades-monetarias'],
                        'Unidades monetarias:',
                        (String newValue) => countryList.EditCountry(
                            'add-item-coins', newValue, country['id']['M49']),
                        (String indexList) => countryList.EditCountry(
                            'remove-item-coins',
                            indexList,
                            country['id']['M49'])),
                    pad,
                    HistoryCountry(
                        'Historico: ',
                        country['historico'],
                        (String newValue) => countryList.EditCountry(
                            'historia', newValue, country['id']['M49'])),
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
