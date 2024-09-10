import 'package:e_commerce_app/view/home/home.dart';
import 'package:e_commerce_app/view/signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  //const login({super.key});
  String user = 'abcd';
  String pswd = '1234';
  var usercontroller = TextEditingController();
  var pswdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(null),
        backgroundColor: Colors.transparent,
      ),
     // backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'welcome',style: TextStyle(fontSize: 40),
            ),
            Text(
              'login to your account',
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_pin),
                 // icon: Icon(Icons.high_quality),
                  border: OutlineInputBorder(),
                  labelText: 'username',
                  hintText: 'enter username'),
              controller: usercontroller,
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                 // icon: Icon(Icons.high_quality),
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  hintText: 'enter password',
                  helperText: 'password must have atleast 4 letters'),
              controller: pswdcontroller,
            ),
            RichText(
                text: TextSpan(
                    text: 'not a user? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                  TextSpan(
                      text: 'SignUp',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Signup()));
                        },
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey))
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MaterialButton(
              onPressed: () {
                if (user == usercontroller.text &&
                    pswd == pswdcontroller.text) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('login success')));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('enter password')));
                }
              },
              color: Colors.green,
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
