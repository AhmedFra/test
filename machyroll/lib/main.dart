import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machyroll/checkauth.dart';
import 'package:machyroll/inventory.dart';
import 'package:machyroll/starting.dart';
import 'Figuier_Page.dart';
import 'login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FiguierPage(),
    );
  }
}
