/*
import 'package:flutter/material.dart';
import 'package:prephuntneet/screens/home_screen.dart';
import 'package:prephuntneet/screens/login_screen.dart';
import 'package:prephuntneet/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService=Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?>snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final User?user=snapshot.data;
          return user==null ?LoginScreen():HomeScreen();
        }
        else{
          return Scaffold(
            body:Center(child:CircularProgressIndicator()),
          );

        }

      }

    );

  }
}
*/
