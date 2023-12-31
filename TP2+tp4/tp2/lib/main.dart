import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_model.dart'; // Import the ColorModel class

import 'login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Login(),
    );
  }
}
