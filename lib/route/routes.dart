import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/mian_screen.dart';
import 'package:todo_app/ui/widget/add_todo_page.dart';
import 'package:todo_app/ui/widget/edit_todo_page.dart';

import '../viewModel/todo_provider.dart';
import '../viewModel/user_provider.dart';

final GoRouter $Router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: GetIt.instance<TodoProvider>()..getTodos()),
            ChangeNotifierProvider(create: (context) => UserProvider()),
          ],
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider.value(
          value: GetIt.instance<TodoProvider>(),
          child: AddTodoPage(),
        );
      },
    ),
    GoRoute(
        path: '/edit/:index',
        builder: (BuildContext context, GoRouterState state) {
          return ChangeNotifierProvider.value(
            value: GetIt.instance<TodoProvider>(),
            child:
                EditTodoPage(index: int.parse(state.pathParameters['index']!)),
          );
        })
  ],
);
