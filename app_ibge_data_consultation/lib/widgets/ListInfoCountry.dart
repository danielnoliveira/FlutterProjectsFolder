import 'package:flutter/material.dart';

class ListInfoCountry extends StatefulWidget {
  final List<dynamic> lista;
  final String title;
  final Function action;
  final Function action2;

  ListInfoCountry(this.lista, this.title, this.action, this.action2);

  @override
  _ListInfoCountryState createState() => _ListInfoCountryState();
}

class _ListInfoCountryState extends State<ListInfoCountry> {
  late String _textFieldValue;

  @override
  void initState() {
    _textFieldValue = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.headline6),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            GestureDetector(
                child: Icon(Icons.add_circle_outline),
                onTap: () =>
                    ShowDialog(context, 'Adicionar elemento:', widget.action))
          ],
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.lista.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(children: [
                Text(
                  '* ${widget.lista[index]['nome']}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                GestureDetector(
                    child: Icon(Icons.delete_forever_outlined),
                    onTap: () => showConfirmationDialog(context,
                        'Excluir elemento:', () => widget.action2('$index')))
              ]);
            }),
      ],
    );
  }

  ShowDialog(BuildContext context, String title, Function action) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: TextFormField(
                onChanged: (text) {
                  setState(() {
                    this._textFieldValue = text;
                  });
                },
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                    action(_textFieldValue);
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ));
  }

  showConfirmationDialog(BuildContext context, String title, Function action2) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: Text('Deseja realmente deletar esse item?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Não'),
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                    action2();
                  },
                  child: const Text('Sim'),
                ),
              ],
            ));
  }
}
