import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_teste/home_page.dart';
import 'package:temporizador_teste/provider/time_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TimerProvider(),
          )
        ],
        child: const MaterialApp(
          home: HomePage(),
        ));
  }
}
