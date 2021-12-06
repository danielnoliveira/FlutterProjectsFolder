import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final double side;
  final String symbol;
  const Square({Key? key, required this.side, required this.symbol}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  var clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.clicked) return;

        setState(() {
          this.clicked = true;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.symbol == 'M'
                ? this.clicked
                    ? Colors.red
                    : Colors.blue
                : Colors.blue,
            border: Border.all(
              width: 1,
              color: Colors.black,
            )),
        height: widget.side,
        width: widget.side,
        child: Text(this.clicked ? widget.symbol : ''),
      ),
    );
  }
}
