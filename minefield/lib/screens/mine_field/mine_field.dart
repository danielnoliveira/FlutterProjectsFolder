import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minefield/presenter/controllers/mine_field_controller.dart';
import 'package:minefield/screens/mine_field/widgets/square/square.dart';

class MineField extends StatelessWidget {
  MineField({Key? key}) : super(key: key);

  MineFieldController _mineFieldController = Get.find();

  @override
  Widget build(BuildContext context) {
    var perfect_side =
        MediaQuery.of(context).size.width / _mineFieldController.numberOfSquares.value;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._mineFieldController.minefield.map((e) => Row(
                        children: [...e.map((s) => Square(side: perfect_side, symbol: s))],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
