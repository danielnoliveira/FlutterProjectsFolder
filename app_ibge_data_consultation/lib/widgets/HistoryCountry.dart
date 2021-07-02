import 'package:flutter/material.dart';

class HistoryCountry extends StatefulWidget {
  final String value;
  final String label;
  final Function action;

  HistoryCountry(this.label, this.value, this.action);
  @override
  _HistoryCountryState createState() => _HistoryCountryState();
}

class _HistoryCountryState extends State<HistoryCountry> {
  late String _textFieldValue;

  @override
  void initState() {
    _textFieldValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Text(
          '${widget.label}',
          style: Theme.of(context).textTheme.headline6,
        )),
        Padding(padding: EdgeInsets.all(10)),
        GestureDetector(
          onTap: () => ShowDialog(context, 'Editar informação:', widget.action),
          child: Icon(
            Icons.edit_sharp,
          ),
        ),
      ],
    );
  }

  ShowDialog(BuildContext context, String title, Function action) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: TextFormField(
                maxLines: 8,
                initialValue: this._textFieldValue,
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
}
