
import 'package:e_commerce_app/view/scratchcard/scratchcard.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  Otp({super.key});
var controller= TextEditingController();
var otpnum='0435';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Verify your OTP',style: TextStyle(fontSize: 30),),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'enter otp'
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(controller.text==otpnum){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Scratchcard()));
                }
              }, child: Text('verify'))
            ],
          ),
        ),
      ),
    );
  }
}
