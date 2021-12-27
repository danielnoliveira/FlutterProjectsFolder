import 'package:flutter/material.dart';

import 'todo_page_widgets/action_bar.dart';
import 'todo_page_widgets/add_todo.dart';
import 'todo_page_widgets/description.dart';
import 'todo_page_widgets/todo_list_view.dart';

class TodoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
        ),
        body: Column(
          children: <Widget>[AddTodo(), ActionBar(), Description(), TodoListView()],
        ));
  }
}
