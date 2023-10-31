import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class OTP_Login extends StatefulWidget {
  OTP_Login({Key? key}) : super(key: key);

  @override
  _OTP_LoginState createState() => _OTP_LoginState();
}

class _OTP_LoginState extends State<OTP_Login> {
  final _formKey = GlobalKey<FormState>();
  var phone = '';
  final phoneController = TextEditingController();
  final TextEditingController verify = TextEditingController();

  Country selected_country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  Future<void> phoneAuth() async {
    final firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+${selected_country.phoneCode}" + phoneController.text.trim(),
      verificationCompleted: (PhoneAuthCredential phoneauth) async {
        await firebaseAuth.signInWithCredential(phoneauth);
      },
      verificationFailed: (error) {
        throw Exception(error.message);
      },
      codeSent: (verificationId, forceResendingToken) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("OTP"),
              actions: [
                TextFormField(
                  controller: verify,
                  decoration: InputDecoration(
                    hintText: "Enter the OTP",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credentials = PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: verify.text,
                      );
                      await firebaseAuth.signInWithCredential(credentials).then((value) {
                       // showSnackBar(context, "Verified");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                      });
                    } catch (e) {
                      //showSnackBar(context, e.toString());
                    }
                  },
                  icon: Icon(Icons.verified, size: 30),
                )
              ],
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              countryListTheme: CountryListThemeData(
                                bottomSheetHeight: 500,
                              ),
                              context: context,
                              onSelect: (value) {
                                setState(() {
                                  selected_country = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${selected_country.flagEmoji}+${selected_country.phoneCode}",
                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    hintText: "Enter your phone number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  controller: phoneController,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone number field cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  phoneAuth();
                },
                child: Text("Verify Phone Number"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
