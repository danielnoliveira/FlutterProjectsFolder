import 'package:flutter/material.dart';
import 'package:mobx_counter_app/pages/counter_page.dart';
import 'package:mobx_counter_app/pages/dice_page.dart';
import 'package:mobx_counter_app/pages/todo_page.dart';
import 'package:mobx_counter_app/store/todo_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<TodoList>(create: (_) => TodoList()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: TodoExample()),
    );
  }
}
