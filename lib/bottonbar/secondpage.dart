import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hi! I am in third page'),
      ),
    );
  }
}
