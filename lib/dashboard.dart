import 'dart:convert';
import 'package:finalprojectkrumony/bottonbar/Fifth.dart';
import 'package:finalprojectkrumony/bottonbar/forthpage.dart';
import 'package:finalprojectkrumony/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottonbar/hommepage.dart';
import 'api.dart';
import 'bottonbar/secondpage.dart';
import 'bottonbar/third.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashboard> {
  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var res = await CallApi().postLogout(token, 'logout');
    var body = json.decode(res.body);
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPageApp(),
      ),
    );
  }

  int cur = 0;
  final screen = [
    const HomePage(),
    const SecondPage(),
    const ThirdPage(),
    const ForthPage(),
    const FifthPage(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Welcome To Dashboard',
          ),
          actions: [
            IconButton(
                onPressed: (() {
                  logout();
                }),
                icon: const Icon(Icons.logout_sharp))
          ],
          backgroundColor: const Color.fromARGB(255, 173, 136, 232),
        ),
        drawer: Drawer(
          width: 250,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: const [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avata.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Mrr Kim Chhorng')
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const LoginPageApp()),
                    ),
                  );
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.train,
              //   ),
              //   title: const Text('Page 2'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
        body: screen[cur],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.black,
          currentIndex: cur,
          onTap: (index) => setState(
            () => cur = index,
          ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'dd',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Search',
            ),
          ],
        ),
      );
}
