import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/api.dart';
import 'dashboard.dart';

class UserInsert extends StatefulWidget {
  const UserInsert({Key? key}) : super(key: key);

  @override
  _UserInsertState createState() => _UserInsertState();
}

class _UserInsertState extends State<UserInsert> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Future<void> insert() async {
    var data = {
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
      'date_of_birth': dobController.text.trim(),
      'phone': phoneController.text.trim(),
    };
    try {
      var res = await CallApi()
          .postData(data, 'user_insert')
          .timeout(const Duration(seconds: 10));
      var body = json.decode(res.body);
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Dashboard()));
    } on TimeoutException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Insert"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'User Insert',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.add_alarm_sharp),
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                  labelText: 'Date of Birth',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: insert,
                child: const Text("Insert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
