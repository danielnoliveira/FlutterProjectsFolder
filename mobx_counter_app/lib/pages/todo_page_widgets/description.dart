import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter_app/store/todo_list.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Observer(
        builder: (_) => Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              list.itemsDescription,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )));
  }
}
