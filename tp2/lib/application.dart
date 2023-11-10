import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_verify.dart';
import 'color_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorModel>(
        create: (_) => ColorModel(),
    child: MaterialApp(
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: const AuthVerify(),
    ),
    );
  }
}