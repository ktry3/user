import 'package:finalprojectkrumony/models/listproduct.dart';
import 'package:flutter/material.dart';
import 'card.dart';

var seen = Set<Product>();
List<Product> list =
      listofproduct.where((product) => seen.add(product)).toList();

//Text(product[i].price.toString()),
class ListAll extends StatefulWidget {

  ListAll({
    Key? key,
    required List<Product> Product,
  }) : super(key: key);

  @override
  State<ListAll> createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {
  @override
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < listofproduct.length; i++)            
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 239, 229, 229)),
                width: double.infinity,
                height: 120,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                      child: Icon(
                        Icons.circle_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image:
                            DecorationImage(image: AssetImage(listofproduct[i].image)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              listofproduct[i].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '\$${listofproduct[i].price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 100, 98, 98),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 227, 199, 116),
                                ),
                                SizedBox(
                                  child: Text('(${listofproduct[i].rate})'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
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
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
