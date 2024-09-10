import 'package:e_commerce_app/view/home/home.dart';
import 'package:e_commerce_app/view/login/login.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      //backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/black(bg.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
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
                    'welcome', // style: GoogleFonts.sahitya(fontSize: 40)
                  ),
                  Text(
                    'create your account', //style: GoogleFonts.sahitya(fontSize: 40),
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
                  RichText(
                      text: TextSpan(
                          text: 'already a user, ',
                          style: TextStyle(color: Colors.white12),
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
                                color: Colors.white12))
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  MaterialButton(
                    onPressed: () {
                      var valid = formkey.currentState!.validate();
                      if (valid == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>Scratchcard()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
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
      ),
    );
  }
}
