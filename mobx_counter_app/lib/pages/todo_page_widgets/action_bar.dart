import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_counter_app/store/todo_list.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Column(children: <Widget>[
      Observer(
        builder: (_) => Column(
          children: <Widget>[
            RadioListTile(
                dense: true,
                title: const Text('All'),
                value: VisibilityFilter.all,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = (filter as VisibilityFilter)),
            RadioListTile(
                dense: true,
                title: const Text('Pending'),
                value: VisibilityFilter.pending,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = (filter as VisibilityFilter)),
            RadioListTile(
                dense: true,
                title: const Text('Completed'),
                value: VisibilityFilter.completed,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = (filter as VisibilityFilter)),
          ],
        ),
      ),
      Observer(
          builder: (_) => ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Remove Completed'),
                    onPressed: list.canRemoveAllCompleted ? list.removedCompleted : null,
                  ),
                  ElevatedButton(
                    child: const Text('Mark All Completed'),
                    onPressed: list.canMarkAllCompleted ? list.markAllAsCompleted : null,
                  )
                ],
              ))
    ]);
  }
}
