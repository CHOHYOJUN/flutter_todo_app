import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/ui/widget/todo_list_page.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('할 일 목록')),
      body: const TodoListPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.go('/add'),
      ),
    );
  }
}
