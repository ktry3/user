import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('My Name Kim Chhorng'),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: const SpinKitPumpingHeart(
                  size: 50,
                  color: Colors.green,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: const SpinKitDualRing(
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const SpinKitChasingDots(
                  size: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
