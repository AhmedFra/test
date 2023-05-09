import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    var grey = Colors.grey;
    return Scaffold(
      backgroundColor: grey[300],
      // ignore: prefer_const_constructors
      body: Column(children: const [Text("voila")]),
    );
  }
}
