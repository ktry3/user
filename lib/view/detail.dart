import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../authentication/loginpage.dart';
import '../models/listproduct.dart';
import 'displayuser.dart';
import 'list_all.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var res = await CallApi().postLogout(token, 'logout');
    var body = json.decode(res.body);
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPageApp(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 240, 245),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Product',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ListAll(
                        Product: [],
                      )),
                ),
              );
            },
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.black,
            ),
          )
        ],
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
              title: const Text('Display User'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const DisplayUser()),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            width: 340,
            height: 410,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 237, 226, 225),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.grey,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(widget.product.image),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sovanah\n',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'EasyChair',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Text(
                            '\$${widget.product.price.toStringAsFixed(2)}'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 100, right: 100),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 149, 188, 19),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 9,
            ),
            child: Row(
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 227, 199, 116),
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '(${widget.product.rate})',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 114, 106, 106),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: const Text(
              'A chair is a type of seat, typically designed for one person \n and consisting of one or more legs, a flat seat and a back-rest. They may be made of wood, metal, or synthetic materials.',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 114, 106, 106),
              ),
            ),
          ),
          Container(
            height: 110,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 225, 217, 195),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    const Text('01'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Total: \$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 34, 49, 56)),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.fromARGB(255, 218, 189, 189),
                        Color.fromARGB(255, 114, 109, 107)
                      ],
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: (() {}),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 22, 156, 152),
                          Color.fromARGB(255, 233, 196, 196),
                        ],
                      ).createShader(
                        bounds,
                      ),
                      child: const Text(
                        'Add To Card',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
