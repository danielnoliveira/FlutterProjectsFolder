import 'package:flutter/material.dart';
import 'package:mobx_counter_app/store/todo_list.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return TextField(
      autofocus: true,
      decoration:
          const InputDecoration(labelText: 'Add a Todo', contentPadding: EdgeInsets.all(8)),
      controller: _textController,
      textInputAction: TextInputAction.done,
      onSubmitted: (String value) {
        list.addTodo(value);
        _textController.clear();
      },
    );
  }
}
