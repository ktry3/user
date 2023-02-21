import 'package:finalprojectkrumony/models/listproduct.dart';
import 'package:flutter/material.dart';
import '../authentication/loginpage.dart';
import '../controller/textwidget.dart';
import 'card.dart';
import 'detail.dart';
import 'displayuser.dart';
import 'list_all.dart';

List<Product>? listofcard;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 240, 245),
        title: const Text(
          'Search',
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
                  builder: ((context) => ListAll(Product: product)),
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
            // ListTile(
            //   tileColor: Colors.amber,
            //   leading: const Icon(
            //     Icons.people_alt_outlined,
            //   ),
            //   title: const Text('Insert User'),
            //   onTap: () {
            //     user_insert();
            //   },
            // ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Row(
              children: [
                Container(
                  width: 250,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 159, 154, 141),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: const Icon(Icons.search),
                      ),
                      const Text(
                        'Forniture of sofa',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 43, 38, 27),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.swap_horiz_outlined,
                    color: Colors.amber[400],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: MyText(
              color: Colors.black,
              size: 20,
              font: FontWeight.bold,
              text: 'This is ${product.length} founded',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => Carded(
                  press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: product[index],
                        ),
                      ),
                    )
                  },
                  product: product[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
