import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/firebase_options.dart';

import 'application.dart';
import 'color_model.dart';  // Import your ColorModel class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorModel>(
          create: (_) => ColorModel(),
        ),
        // Other providers if needed
      ],
      child: const MyApp(),
    ),
  );
}
