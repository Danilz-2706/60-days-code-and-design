import 'package:bloc_manager/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter1 _appRouter1 = AppRouter1();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter1.OnGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter1.dispose();
    super.dispose();
  }
}
