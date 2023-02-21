import 'dart:async';
import 'dart:convert';
import 'package:finalprojectkrumony/view/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api.dart';
import 'register.dart';

class LoginPageApp extends StatefulWidget {
  const LoginPageApp({Key? key}) : super(key: key);

  @override
  State<LoginPageApp> createState() => _LoginPageAppState();
}

class _LoginPageAppState extends State<LoginPageApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> login_process() async {
      var data = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };
      try {
        var res = await CallApi()
            .postData(data, 'login')
            .timeout(const Duration(seconds: 10));
        var body = json.decode(res.body);

        if (body['token'] == null) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.warning,
            text: 'wrong password or email',
          );
        } else {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('token', body['token']);
          localStorage.setString(
            'token',
            json.encode(body['token']),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        }
      } on TimeoutException catch (e) {}
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       fit: BoxFit.cover, image: AssetImage('assets/images/image1.jpg')),
        // ),
        child: Form(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                          width: 2,
                        ),
                      ),
                      hintText: 'Enter Email Address',
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
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintStyle:
                          const TextStyle(color: Colors.amber, fontSize: 17),
                      hintText: 'Enter password',
                    ),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton.filled(
                      child: const Text('Login'),
                      onPressed: () {
                        login_process();
                      }),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                      const Text(
                        'Don\'t have any account?',
                        style: TextStyle(color: Colors.black),
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
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                          child: const Text('Sign Up'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // child: Column(
        //   children: <Widget>[
        //     const Text(
        //       'Login',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 30,
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.all(10),
        //       child: TextField(
        //         controller: emailController,
        //         decoration: const InputDecoration(
        //           filled: true,
        //           prefixIcon: Icon(Icons.mail),
        //           border: OutlineInputBorder(),
        //           labelText: 'Email',
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //       child: TextField(
        //         controller: passwordController,
        //         obscureText: true,
        //         decoration: const InputDecoration(
        //           filled: true,
        //           prefixIcon: Icon(Icons.lock),
        //           border: OutlineInputBorder(),
        //           labelText: 'Password',
        //         ),
        //       ),
        //     ),
        //     Container(
        //       height: 60,
        //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //       child: ElevatedButton(
        //         onPressed: login_process,
        //         child: Text("Login"),
        //       ),
        //     ),
        //     Container(
        //       height: 60,
        //       padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //       child: ElevatedButton(
        //         onPressed: (() => Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: ((context) => Register()),
        //               ),
        //             )),
        //         child: Text("Register"),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
