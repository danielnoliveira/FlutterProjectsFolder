import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

class MineFieldController extends GetxController {
  var minefield = List.filled(10, List.filled(10, '0')).obs;
  var life = 1.obs;
  var numberOfMines = 10;
  var numberOfSquares = 10.obs;

  loadingBoard() {
    _randomizeMines();
    _countMinesInEachSquare();
  }

  void _randomizeMines() {
    var rn = Random();

    var minesLeft = numberOfMines;

    List<List<String>> minefieldCopy = [
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'],
      ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0']
    ];

    while (minesLeft != 0) {
      var col = rn.nextInt(9);
      var row = rn.nextInt(9);
      // print(col.toString() + ' ' + row.toString());
      if (minefieldCopy[row][col] == 'M') {
        continue;
      } else {
        minefieldCopy[row][col] = 'M';
        minesLeft -= 1;
        print(minesLeft);
      }
    }
    minefield.value = minefieldCopy;
  }

  void _countMinesInEachSquare() {
    var posAround = [
      [-1, -1],
      [1, 1],
      [-1, 1],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, -1],
      [1, 0],
    ];
    for (var i = 0; i < 10; i++) {
      for (var j = 0; j < 10; j++) {
        if (minefield[i][j] == 'M') {
          continue;
        } else {
          var minesQuantity = 0;
          for (var pos in posAround) {
            try {
              minesQuantity += minefield[pos[0] + i][pos[1] + j] == 'M' ? 1 : 0;
            } catch (e) {
              //
            }
          }
          minefield[i][j] = minesQuantity.toString();
        }
      }
    }
  }
}
