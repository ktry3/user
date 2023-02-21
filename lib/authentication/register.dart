import 'dart:async';
import 'dart:convert';
import 'package:finalprojectkrumony/authentication/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api.dart';
import '../view/dashboard.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> register_process() async {
    var data = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };
    try {
      var res = await CallApi()
          .postData(data, 'register')
          .timeout(const Duration(seconds: 10));
      var body = json.decode(res.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['access_token']);
      localStorage.setString('user', json.encode(body['data']));
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Dashboard()));
    } on TimeoutException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(color: Color.fromARGB(255, 223, 118, 118)),
        ),
        backgroundColor: const Color.fromARGB(255, 119, 227, 194),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/image3.png')),
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: nameController,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 193, 163, 73),
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 4,
                        ),
                      ),
                      hintText: ' FullName',
                      hintStyle:
                          const TextStyle(color: Colors.amber, fontSize: 17),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 193, 163, 73),
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 4,
                        ),
                      ),
                      hintText: ' Email Address',
                      hintStyle:
                          const TextStyle(color: Colors.amber, fontSize: 17),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 193, 163, 73),
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 4,
                        ),
                      ),
                      hintText: ' Password',
                      hintStyle:
                          const TextStyle(color: Colors.amber, fontSize: 17),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton.filled(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      register_process();
                    },
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      const Text(
                        'I am a member',
                        style:
                            TextStyle(color: Color.fromARGB(255, 220, 98, 77)),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPageApp(),
                              ),
                            );
                          },
                          child: const Text('Sign In'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
