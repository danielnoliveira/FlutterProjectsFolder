import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter_app/store/dice_counter.dart';

final diceCounter = DiceCounter();

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  child: Observer(
                    builder: (_) => Text(
                      '${diceCounter.left}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Verdana'),
                    ),
                  ),
                  onPressed: diceCounter.roll,
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Observer(
                    builder: (_) => Text(
                      '${diceCounter.right}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: 'Verdana'),
                    ),
                  ),
                  onPressed: diceCounter.roll,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(
              builder: (_) => Text(
                'Total ${diceCounter.total}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: 'Verdana'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
