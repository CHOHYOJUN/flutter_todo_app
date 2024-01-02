import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo_app/route/routes.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/viewModel/todo_provider.dart';

void main() {
  /// 기본
  runApp(
    MyApp(),
  );

  /// 하나의 상태관리
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => TodoProvider(),
  //     child: MyApp(),
  //   ),
  // );

  /// 멀티 상태관리
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => TodoProvider()),
  //       /// 추가
  //     ],
  //     child: const MyApp(),
  //   ),
  // );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: $Router,
      title: 'Flutter Todo Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainScreen(),
    );
  }
}