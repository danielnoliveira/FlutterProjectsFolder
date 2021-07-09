import 'package:flutter/material.dart';

import 'dash.dart';

class AutoHideDash extends StatefulWidget {
  final Dash dash;

  const AutoHideDash({Key? key, required this.dash}) : super(key: key);

  @override
  _AutoHideDash createState() {
    return _AutoHideDash();
  }
}

class _AutoHideDash extends State<AutoHideDash> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
            opacity: widget.dash.isVisible ? 1 : 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: Image.network(widget.dash.url),
            )),
        Switch(
            value: widget.dash.isVisible,
            onChanged: (value) => setState(() {
                  widget.dash.isVisible = value;
                }))
      ],
    );
  }
}
