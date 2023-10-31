
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/homepage.dart';
import 'package:new_project/loginscreen.dart';
import 'package:new_project/user_provider.dart';
import 'package:provider/provider.dart';

import 'auth_otp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.hasData){
              return home1();
            }else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'));
            }
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return OTP_Login();
        })
        //loginscreen(),
      ),
    );
  }
}
