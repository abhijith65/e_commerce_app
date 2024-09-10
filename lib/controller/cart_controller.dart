import 'package:get/get.dart';

//to make a variable observable use obs or RxDart class
//to make a widget observable using get use Obx() or GetxBuilder()

class CartController extends GetxController {

  var list=[].obs;
  // obs means this integer value is observable

  void add1( value) {
    list.add(value);

  }

  void remove1(value) {
    list.remove(value);
  }
}