import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minefield/presenter/controllers/mine_field_controller.dart';

class Levels extends StatelessWidget {
  Levels({Key? key}) : super(key: key);

  MineFieldController _mineFieldController = Get.find();
  final levels = 25;
  var i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIVEIS'),
            GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 5,
                children: [
                  ...List.generate(levels, (i) => i + 1).map((e) => ElevatedButton(
                      onPressed: () {
                        _mineFieldController.numberOfMines = 10 + e;
                        _mineFieldController.loadingBoard();
                        Get.toNamed('/mine_field');
                      },
                      child: Text(e.toString())))
                ])
          ],
        ),
      ),
    );
  }
}
