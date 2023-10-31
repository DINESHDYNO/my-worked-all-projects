import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project/user_models.dart' as model;
import 'package:new_project/user_provider.dart';
import 'package:provider/provider.dart';


class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  /*bool isLoading = true;

  String username = '';
  String email = '';
  String phone = '';
  String uid = '';
  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      isLoading = false;
      username = (snap.data() as Map<String, dynamic>)['username'];
      email = (snap.data() as Map<String, dynamic>)['email'];
      phone = (snap.data() as Map<String, dynamic>)['phone'];
      uid = (snap.data() as Map<String, dynamic>)['uid'];
    });
  }*/
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    addData();
  }
  addData() async {
    UserProvider _userProvider=Provider.of(context,listen: false);
    await _userProvider.refreshUser();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User? user=Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            :Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user!.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              user!.email,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              user!.phone,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            Text(
              user!.uid,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
