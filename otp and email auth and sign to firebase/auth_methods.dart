import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/user_models.dart' as model;

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;


class AuthMethods {

  Future<model.User>getUserDetails() async {
    User currentUser=_auth.currentUser!;
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return model.User.fromSnap(snap);
  }


  SignUpUser(
      {required String username,
      required String phone,
      required String email,
      required password}) async {
    String res = "some error Occurred";
    try {
      if (username.isNotEmpty || phone.isNotEmpty || email.isNotEmpty || password) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        model.User _user=model.User(username: username, uid: cred.user!.uid, email: email, phone: phone);
        await _firestore.collection('users').doc(cred.user!.uid).set(_user.toJson());
        res = "success";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }


  loginUser({
    required String email,required String password
}) async {
    String res = "some error Occurred";
    try{
      if(email.isNotEmpty||password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res="success";
      }
    }catch(e){
      return e.toString();
    }
    return res;
  }



}
