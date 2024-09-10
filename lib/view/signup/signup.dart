import 'package:e_commerce_app/view/home/home.dart';
import 'package:e_commerce_app/view/login/login.dart';
import 'package:e_commerce_app/view/otp/otp.dart';
import 'package:e_commerce_app/view/scratchcard/scratchcard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var pwdvisible = true;
  var formkey = GlobalKey<FormState>();
  var otpnum='0435';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(null),
      ),
      //backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'welcome',style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 10,),
                Text(
                  'create your account',
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                     // icon: Icon(Icons.high_quality),
                      border: OutlineInputBorder(),
                      labelText: 'username',
                      hintText: 'enter username'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_pin),
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      hintText: 'enter email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    obscureText: pwdvisible,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 4) {
                        return 'enter valid password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                       // icon: Icon(Icons.high_quality),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (pwdvisible == true) {
                                  pwdvisible = false;
                                } else {
                                  pwdvisible = true;
                                }
                              });
                            },
                            icon: Icon(pwdvisible == true
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        border: OutlineInputBorder(),
                        labelText: 'password',
                        //hintText: 'enter password',
                        hintText: 'password must have atleast 4 letters')),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: pwdvisible,
                  validator: (password) {
                    if (password!.isEmpty || password.length < 4) {
                      return 'enter valid password';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (pwdvisible == true) {
                                pwdvisible = false;
                              } else {
                                pwdvisible = true;
                              }
                            });
                          },
                          icon: Icon(pwdvisible == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: 'confirm password',
                      hintText: 'reenter password'),
                ),
                SizedBox(height: 10,),
                RichText(
                    text: TextSpan(
                        text: 'already a user, ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(
                          text: 'LogIn',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54))
                    ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                MaterialButton(
                  onPressed: () {
                    var valid = formkey.currentState!.validate();
                    if (valid == true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('your otp is $otpnum')));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Otp()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            dismissDirection: DismissDirection.up,behavior: SnackBarBehavior.floating,
                              content: Text("Registration failed")));
                    }
                  },
                  color: Colors.green,
                  child: Text('signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
