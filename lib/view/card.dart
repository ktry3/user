import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controllers.dart';
import '../models/listproduct.dart';

List<Product> listofproduct = [];

class Carded extends StatefulWidget {
  final Product product;
  final VoidCallback press;
  Carded({super.key, required this.product, required this.press});

  @override
  State<Carded> createState() => _CardedState();
}

class _CardedState extends State<Carded> {
  final controller = Get.put(Colorr());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                color: Colors.grey,
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: AssetImage(widget.product.image),
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      icon: Obx(() => Icon(
                            controller.istrue == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                          )),
                      onPressed: () {
                        controller.isTrue();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sovanah\n',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'EasyChair',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 227, 199, 116),
                  ),
                  SizedBox(
                    child: Text('(${widget.product.rate})'),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.product.title}\n ',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 119, 113, 113),
                            ),
                          ),
                          TextSpan(
                            text: '\$${widget.product.price}',
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 234, 185, 185),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton.small(
                    onPressed: () {
                      for (int i = 0; i < listofproduct.length; i++)
                      {
                        if (listofproduct[i].image == widget.product.image)
                        {
                          return;
                        }
                      }
                      listofproduct.add(widget.product);
                      print(listofproduct);
                    },
                    backgroundColor: Colors.brown,
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 227, 199, 116),
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
