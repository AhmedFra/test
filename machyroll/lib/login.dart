// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController useranameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useranameController.text.trim(),
          password: passwordController.text.trim(),
        );
      } catch (e) {
        print('Error occurred while logging in: $e');
      }
    }

    @override
    void dispose() {
      useranameController.dispose();
      passwordController.dispose();
    }

    return Stack(
      children: [
        Image.asset(
          'assets/pics/bg_alone.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        hmedTextField("username", useranameController),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 75, 73, 73),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'password',
                                  ),
                                ),
                              ),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            // Validate renvoie vrai si le formulaire est valide, faux sinon.
                            if (_formKey.currentState!.validate()) {
                              login();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('works lets gooooo')),
                              );
                            }
                          },
                          child: const Text("go in "),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

Widget hmedTextField(String label, TextEditingController controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 75, 73, 73),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
            ),
          ),
        ),
      ));
}
