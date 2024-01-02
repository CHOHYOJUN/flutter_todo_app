import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../viewModel/todo_provider.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final todoProvider = Provider.of<TodoProvider>(context);
    final todoProvider = context.read<TodoProvider>(); // Provider.of 대신 context.read 사용

    return Scaffold(
      appBar: AppBar(title: Text('할 일 추가')),
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
              child: Text('추가'),
              onPressed: () {
                final title = _textEditingController.text;
                todoProvider.addTodo(title);
                // Navigator.of(context).pop();
                // context.pop(); // 에러 발생
                context.go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}