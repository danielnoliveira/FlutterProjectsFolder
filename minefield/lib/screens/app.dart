import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minefield/presenter/bindings/mine_field_binding.dart';
import 'package:minefield/screens/levels/levels.dart';
import 'package:minefield/screens/menu/menu.dart';
import 'package:minefield/screens/mine_field/mine_field.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/mine_field', page: () => MineField(), binding: MineFieldBinding()),
        GetPage(name: '/home', page: () => Menu()),
        GetPage(name: '/levels', page: () => Levels(), binding: MineFieldBinding()),
      ],
    );
  }
}
