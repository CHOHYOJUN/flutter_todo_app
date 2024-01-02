import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/mian_screen.dart';
import 'package:todo_app/ui/widget/add_todo_page.dart';
import 'package:todo_app/ui/widget/edit_todo_page.dart';

import '../viewModel/todo_provider.dart';
import '../viewModel/user_provider.dart';

final todoProvider = TodoProvider();

final GoRouter $Router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: todoProvider), // 재사용
            ChangeNotifierProvider(create:(context)=> UserProvider()), // UserProvider 생성
          ],
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider.value(
          value: todoProvider,
          child: AddTodoPage(),
        );
      },
    ),
    GoRoute(
        path: '/edit/:index',
        builder: (BuildContext context, GoRouterState state) {
          return ChangeNotifierProvider.value(
            value: todoProvider,
            child: EditTodoPage(index: int.parse(state.pathParameters['index']!)),
          );
        }
    )
  ],
);
