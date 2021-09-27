
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prephuntneet/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'package:flutter/gestures.dart';
import 'package:prephuntneet/Components/theme_helper.dart';

import 'forgotpassword.dart';
import 'profilepage.dart';
import 'register_screen.dart';
import 'package:prephuntneet/Components/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  String? email;
  String? password;

  String? PhNum;
  String? Name;
  String? Username;

  void _toggleVisibility(){
    setState(() {
      _isHidden= true^_isHidden;
    });
  }
  InputDecoration PasswordDecoration([String lableText="", String hintText = ""]){
    return InputDecoration(

      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,

      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: _toggleVisibility,
        icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),

      ) ,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  void displayDialog(FirebaseAuthException errorMess) {
    String displaymess;

    if(errorMess.message != null)
    {
      displaymess=errorMess.message!;
    }
    else
    {
      displaymess=errorMess.code;

    }

    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text(displaymess),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true, child: new Text("Ok"),
            onPressed: ()=>Navigator.pop(context),



          )
        ],
      ),
    );
  }
  bool _isHidden = true;

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    final authService =Provider.of<AuthService>(context);



    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'PrepHunt',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(

                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(

                                  validator:(val)=>val!.isEmpty?'Enter the email':null,
                                  onChanged: (val){
                                    setState(()=>email=val);

                                  },


                                  decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),


                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(


                                onChanged:(val){
                                  setState(()=>password=val);

                                },

                                  validator:(val)=>val!.length<6?'Enter a valid Password ':null,

                                  obscureText: _isHidden,
                                  decoration: PasswordDecoration('Password', 'Enter your password'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                  },
                                  child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                  ),
                                    onPressed: ()
                                    async {

                                      try{
                                        final current2 = await authService
                                            .signInWithEmailAndPassword(
                                            email!, password!);
                                        await FirebaseFirestore.instance.collection(
                                            "UserData")
                                            .doc(current2!.uid)
                                            .get()
                                            .then((value) {
                                          Username =
                                          value.data()!["Username"];
                                          PhNum =
                                          value.data()!["Phone number"];
                                          Name =
                                          value.data()!["Display name "];
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(Username,PhNum,Name,email)));



                                        });
                                      }
                                      on FirebaseAuthException
                                      catch(e)
                                      {

                                        displayDialog(e);
                                      }

                                    }



                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10,20,10,20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(
                                    TextSpan(
                                        children: [
                                          TextSpan(text: "Don\'t have an account? "),
                                          TextSpan(
                                            text: 'Create',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                              },
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}
