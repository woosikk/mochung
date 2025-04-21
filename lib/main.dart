import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '우식❤️혜원 결혼합니다',
      theme: ThemeData (
        fontFamily: 'GowunBatang',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: TextTheme(
        bodyLarge: TextStyle(color: const Color(0xFF000000)), // 일반 텍스트 (검은색)
        bodyMedium: TextStyle(color: const Color(0xFF000000)), // 일반 텍스트 (검은색)
        bodySmall: TextStyle(color: const Color(0xFF000000)), // 일반 텍스트 (검은색)
        titleLarge: TextStyle(color: const Color(0xFF000000)), // 부제목 (검은색)
        titleMedium: TextStyle(color: const Color(0xFF000000)), // 부제목 (검은색)
        titleSmall: TextStyle(color: const Color(0xFF000000)), // 부제목 (검은색)
        headlineLarge: TextStyle(color: const Color(0xFF000000)), // 제목 (검은색)
        headlineMedium: TextStyle(color: const Color(0xFF000000)), // 제목 (검은색)
        headlineSmall: TextStyle(color: const Color(0xFF000000)), // 제목 (검은색)
        displayLarge: TextStyle(color: const Color(0xFF000000)), // 큰제목 (검은색)
        displayMedium: TextStyle(color: const Color(0xFF000000)), // 큰제목 (검은색)
        displaySmall: TextStyle(color: const Color(0xFF000000)), // 큰제목 (검은색)
        labelLarge: TextStyle(color: const Color(0xFF000000)), // 라벨 (검은색)
        labelMedium: TextStyle(color: const Color(0xFF000000)), // 라벨 (검은색)
        labelSmall: TextStyle(color: const Color(0xFF000000)), // 라벨 (검은색)
      ),
      ),
      home: Container(
        width: 500.0,
        child: MyHomePage(),
    ));
  }
}