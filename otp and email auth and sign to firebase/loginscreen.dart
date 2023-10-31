import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/Createaccount.dart';
import 'package:new_project/auth_methods.dart';
import 'package:new_project/contants.dart';
import 'package:new_project/homepage.dart';

import 'ForgotPwd.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isloading=false;

  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  loginUser() async {
    setState(() {
      isloading = true;
    });
    String email = emailController.text;
    String password = passwordController.text;

    if (_formKey.currentState!.validate()) {
      String result=await AuthMethods().loginUser(email: email, password: password);

      if (result == 'success') {
        setState(() {
          isloading = false;
        });
        showSnackBar(_scaffoldKey.currentContext!, result);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home1()));
      }else {
        showSnackBar(_scaffoldKey.currentContext!, result);
        setState(() {
          isloading = false;
        });
      }
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/Dddileep11.jpg',
                fit: BoxFit.cover,
                height: height * 0.40,
                width: width,
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  appName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 29,
                      color: Colors.black),
                ),
              ),
              Center(
                child: Text(
                  slogan,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    labelText: 'EMAIL ADDRESS',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },

              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.blue,
                ),
                label: Text(
                  'PASSWORD',
                ),
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPwd(),),);
                    },
                    child: Text(
                      'Froget Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child:isloading?CircularProgressIndicator(
                    color: Colors.blue,
                  ): ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 115, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onPressed: loginUser,/*()
                async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email = emailController.text;
                      password = passwordController.text;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                    });
                    // userLogin();
                  }
                },*/
                    child: Text(
                  'Login to account',
                  style: TextStyle(fontSize: 18, letterSpacing: 0.6,color: Colors.white),
                ),
              )),
               SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>createacc()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


