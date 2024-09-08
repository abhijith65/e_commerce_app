import 'package:e_commerce_app/view/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash(),
    );
  }
}
