
import 'package:e_commerce_app/view/signup/signup.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((onValue){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined,size: 80,),
            Text('Shoppy',style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
