import 'dart:io';

import 'package:cat_trivia/data/fact_model.dart';
import 'package:cat_trivia/feature/fact/fact_screen.dart';
import 'package:cat_trivia/network/http_override.dart';
import 'package:cat_trivia/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(FactModelAdapter());
  Hive.registerAdapter(FactsAdapter());

  HttpOverrides.global = MyHttpOverrides();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FactScreen(),
    );
  }
}
