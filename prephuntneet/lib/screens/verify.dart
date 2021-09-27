
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth =FirebaseAuth.instance;
  User? user;
  Timer? timer;



  @override
  void initState()
  {
    print("helllo");

    user=auth.currentUser;
    user?.sendEmailVerification();
    timer=Timer.periodic(Duration(seconds:5),(timer){
      checkEmailVerify();

    });

    super.initState();


  }
  @override
  void dispose()
  {
    timer?.cancel();

    super.dispose();

  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("An email has been sent to ${user!.email} please verfy"))
    );
  }

  Future<void> checkEmailVerify() async {
    user=auth.currentUser;
    await user?.reload();
          if(user!.emailVerified)
            {
              timer?.cancel();

              Navigator.of(context).
              pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));


            }
  }

}

