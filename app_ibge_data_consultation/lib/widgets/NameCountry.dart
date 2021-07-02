import 'package:flutter/material.dart';

class NameCountry extends StatefulWidget {
  final String value;
  final Function action;

  NameCountry(this.value, this.action);
  @override
  _NameCountryState createState() => _NameCountryState();
}

class _NameCountryState extends State<NameCountry> {
  late String _textFieldValue;

  @override
  void initState() {
    _textFieldValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Text(
          widget.value,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
        )),
        Padding(padding: EdgeInsets.all(10)),
        GestureDetector(
          onTap: () => ShowDialog(
              context, 'Editar informação:', widget.value, widget.action),
          child: Icon(
            Icons.edit_sharp,
          ),
        ),
      ],
    );
  }

  ShowDialog(
      BuildContext context, String title, String content, Function action) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: TextFormField(
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
