import 'package:flutter/material.dart';
import 'package:new_project/auth_methods.dart';
import 'package:new_project/homepage.dart';
import 'package:new_project/loginscreen.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

class createacc extends StatefulWidget {
  @override
  State<createacc> createState() => _createaccState();
}

class _createaccState extends State<createacc> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading=false;
  var name = "";
  var phone = "";
  var email = "";
  var password = "";
  var confirmPassword = "";

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  singUpUser() async {
    setState(() {
      isloading = true;
    });

    String name = nameController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      showSnackBar(_scaffoldKey.currentContext!, 'Passwords and Confirm Password do not match');
      return;
    }

    if (_formKey.currentState!.validate()) {
      String result = await AuthMethods().SignUpUser(
        username: name,
        phone: phone,
        email: email,
        password: password,
      );

      if (result == 'success') {
        setState(() {
          isloading = false;
        });
        showSnackBar(_scaffoldKey.currentContext!, result);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home1()));
      } else {
        showSnackBar(_scaffoldKey.currentContext!, result);
        setState(() {
          isloading = false;
        });
      }
      print(result);
    }
    setState(() {
      isloading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF1E88E5),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                const Center(
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please Enter Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Phone no'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Email Adress',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter Valid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Confirm Password'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: isloading?CircularProgressIndicator(
                    color: Colors.white,
                  ): ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 122, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Color(0xFF0D47A1),
                    ),
                    onPressed:
                        singUpUser /*() {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = nameController.text;
                            phone = phoneController.text;
                            email = emailController.text;
                            password = passwordController.text;
                            confirmPassword = confirmPasswordController.text;
                            Navigator.pop(context);
                          });
                        }
                      },*/
                    ,
                    child: Text(
                      'Create account',
                      style: TextStyle(fontSize: 18, letterSpacing: 0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        'Already have a accounts?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () => {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            loginscreen(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                )
                              },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
