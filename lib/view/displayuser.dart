import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import '../api/api.dart';

class DisplayUser extends StatefulWidget {
  const DisplayUser({Key? key}) : super(key: key);

  @override
  State<DisplayUser> createState() => _DisplayUserState();
}

class _DisplayUserState extends State<DisplayUser> {
  List<dynamic>? user;
  List<dynamic> users = [];
  bool isLoading = true;

  // getPost() async {
  //   PostService service = PostService();
  //   List<PostModel>? list = await service.getPost();
  //   if (list != null) {
  //     setState(() {
  //       postList.addAll(list);
  //       isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       postList.addAll([]);
  //       isLoading = true;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   getPost();
  //   super.initState();
  // }

  // void user_select() async {
  //   var datas = {};
  //   final response = await CallApi().postData(datas, 'user_select');
  //   List<PostModel>? body = json.decode(response.body).cast<PostModel>();
  //   if (body != null) {
  //     setState(() {
  //       postmodel.addAll(body);
  //     });
  //   } else {
  //     setState(() {
  //       postmodel.addAll([]);
  //     });
  //   }
  // }
  @override
  initState() {
    super.initState();
    user_select();
  }

  Future<void> user_select() async {
    // TODO: implement initState
    super.initState();
    var data = {};
    try {
      var res = await CallApi()
          .postData(data, 'user_select')
          .timeout(const Duration(seconds: 10));
      Map<String, dynamic> body = json.decode(res.body);
      // PostModel model = PostModel.fromJson(jsonDecode(res.body));
      // print(user);
      user = body["user_informations"];
      setState(() {
        users = user!;
      });
      //print(user![0]["first_name"]);
    } on TimeoutException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View Builder"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var fullname =
                users[index]["first_name"] + " " + users[index]["last_name"];
            var phone = users[index]["phone"];
            var dob = users[index]["date_of_birth"];
            return Card(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(
                          "Date of Birth: " + dob.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 90, 69, 5),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(
                          "Phone Number: " + phone.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 55, 47, 24),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(vertical: -3),
                      title: Text(
                        "Name: " + fullname.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
