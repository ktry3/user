import 'package:get/get.dart';

class Cont extends GetxController {
  final RxInt count = 0.obs;
  void Incre() {
    count.value++;
  }

  void Decre() {
    count.value > 0 ? count.value-- : 0;
  }
}

class Colorr extends GetxController {
  final RxBool istrue = true.obs;
  void isTrue() {
    if (istrue.value == false) {
      istrue.value = true;
    } else {
      istrue.value = false;
    }
  }
}
