import 'package:flutter/material.dart';
import 'package:todo_app/route/routes.dart';

import '../di/di_provider_setup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {



  /// 파이어베이스 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// DI주입 Get_It 인스턴스 등록
  todoProviderDiSetup();

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