import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../viewModel/todo_provider.dart';

class EditTodoPage extends StatelessWidget {
  final int index;

  EditTodoPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>(); // Provider.of 대신 context.read 사용
    final TextEditingController _textEditingController = TextEditingController(
      text: todoProvider.todos[index].title,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('할 일 수정')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: '할 일',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('저장'),
              onPressed: () {
                final title = _textEditingController.text;
                todoProvider.todos[index].title = title;
                // Navigator.of(context).pop();
                context.go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
