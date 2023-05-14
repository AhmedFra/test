import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machyroll/checkauth.dart';
import 'package:machyroll/login.dart';

// ignore: camel_case_types
class starting extends StatefulWidget {
  const starting({Key? key}) : super(key: key);

  @override
  State<starting> createState() => _startingState();
}

class _startingState extends State<starting> {
  TextStyle linkStyle = const TextStyle(color: Colors.grey, fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/pics/bg_with_logo.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("you started !!!!!!!! woohhooo");
                  FirebaseAuth.instance.signOut();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const checkauth()));
                  },
                  child: const Text(
                    'Get Started!',
                    style: TextStyle(
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 60,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
