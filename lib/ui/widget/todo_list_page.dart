import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../viewModel/todo_provider.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider =
        context.watch<TodoProvider>(); // Provider.of 대신 context.watch 사용

    return ListView.builder(
      itemCount: todoProvider.todos.length,
      itemBuilder: (context, index) {

        final todo = todoProvider.todos[index];

        return ListTile(
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (_) => context.read<TodoProvider>().toggleComplete(index), // Provider.of 대신 context.read 사용
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.go('/edit/$index'),
          ),
          onLongPress: () => context.read<TodoProvider>().removeTodo(index), // Provider.of 대신 context.read 사용
        );
      },
    );
  }
}
