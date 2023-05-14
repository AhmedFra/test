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
  String err = "loggin in";
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
                        Image.asset("assets/pics/hlaf.png"),
                        hmedTextField("username", useranameController),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(153, 75, 73, 73),
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'password',
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value == "") {
                                      err = 'Please enter a password.';
                                    }
                                    if (value!.length < 8) {
                                      err =
                                          'Password must be at least 6 characters long.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 15),
                              backgroundColor:
                                  const Color.fromARGB(255, 33, 32, 33),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              // Validate renvoie vrai si le formulaire est valide, faux sinon.
                              if (_formKey.currentState!.validate()) {
                                login();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(err)),
                                );
                              }
                            },
                            child: const Text("Sign in"),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "by clicking the <sign in> button you accept our temrs of use and agreement ",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(207, 189, 184, 184)),
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
            color: const Color.fromARGB(153, 75, 73, 73),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ));
}
