
import 'package:e_commerce_app/view/scratchcard/scratchcard.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  Otp({super.key});
var controller= TextEditingController();
var otpnum='0435';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Verify your OTP',style: TextStyle(fontSize: 30),),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'enter otp'
            ),
          ),
          ElevatedButton(onPressed: (){
            if(controller.text==otpnum){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Scratchcard()));
            }
          }, child: Text('verify'))
        ],
      ),
    );
  }
}
