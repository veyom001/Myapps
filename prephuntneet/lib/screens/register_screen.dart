
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prephuntneet/Components/theme_helper.dart';
import 'package:prephuntneet/Components/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:prephuntneet/screens/login_screen.dart';
import 'package:prephuntneet/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{
  String Email="";
  String LastName="";
  String Username="";
  String Pass1="";
  String Pass2="";
  String PhNum="";
  String FirstName ="";
  bool _isHidden = true;
  bool _isHidden2 = true;
  void _toggleVisibility(){
    setState(() {
      _isHidden = true^_isHidden;
    });
  }
  void _toggleVisibility2(){
    setState(() {
      _isHidden2= true^_isHidden2;
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
  InputDecoration PasswordDecoration2([String lableText="", String hintText = ""]){
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: _toggleVisibility2,
        icon: _isHidden2 ? Icon(Icons.visibility_off) : Icon(Icons.visibility),

      ) ,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  void incorrectPassDialog(String mess) {


    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text(mess),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true, child: new Text("Ok"),
            onPressed: ()=>Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void showSuccess() {


    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Success"),
        content: new Text("You have successfully created account you can now log in"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true, child: new Text("Ok"),
            onPressed: ()=>Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => LoginPage()

                ),


                    (Route<dynamic> route) => false,

            ),
          ),

        ],
      ),
    );
  }
  void displayDialog(FirebaseAuthException errorMess) {
    String displayMess;

    if(errorMess.message != null)
    {
      displayMess=errorMess.message!;
    }
    else
    {
      displayMess=errorMess.code;

    }



    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text(displayMess),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true, child: new Text("Ok"),
            onPressed: ()=>Navigator.pop(context),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    final authService=Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(

                          child: TextFormField(

                            onChanged: (val){
                              setState(()=>Username=val);

                            },


                            decoration: ThemeHelper().textInputDecoration('User name ', 'Enter your username'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height:10),

                        Container(

                          child: TextFormField(

                            onChanged: (val){
                              setState(()=>FirstName=val);

                            },
                            decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(

                          child: TextFormField(

                            onChanged: (val){
                              setState(()=>LastName=val);

                            },
                            decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name',),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onChanged: (val){
                              setState(()=>Email=val);

                            },
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email",Icon(Icons.email)),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(

                            onChanged: (val){
                              setState(()=>PhNum=val);

                            },

                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number",Icon(Icons.phone)),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              else if(val.isEmpty)
                                {
                                  return "It can't be left empty ";

                                }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onChanged: (val){
                              setState(()=>Pass1=val);

                            },
                            obscureText:_isHidden,
                            decoration: PasswordDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        Container(
                          child: TextFormField(
                            onChanged: (val){
                              setState(()=>Pass2=val);

                            },
                            obscureText: _isHidden2,
                            decoration: PasswordDecoration2(
                                "Confirm Password*", "Confirm your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please confirm your password";
                              }
                              else if(val!=Pass1)
                                  {
                                    return "Passwords don't match ";

                                  }

                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),

                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),



                                child: Text(
                                  "Register".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                            ),


                            onPressed: ()async{
                              if(Pass1==Pass2&&checkboxValue){
                                try {

                                  final current1=await authService.createUserWithEmailAndPassword(Email, Pass1);
                                  await FirebaseFirestore.instance.collection("UserData").doc(current1!.uid).set({
                                    "Email":Email,
                                    "Phone number":PhNum,
                                    "Username":Username,
                                    "Display name ":FirstName+" "+LastName,
                                  });
                                  await FirebaseFirestore.instance.collection("Username").doc(current1.uid).set({
                                    "Username":Username,
                                  });



                                  await authService.signout();
                                  showSuccess();
                                }
                                on FirebaseAuthException
                                catch (e) {
                                  displayDialog(e);
                                }
                              }
                              else if(Pass1!=Pass2)
                              {
                                incorrectPassDialog("Passwords entered doesn't match ");
                                // print("Entered Passwords are ${passwordController2} and ${passwordController}");


                              }
                              else
                                {
                                  incorrectPassDialog("You need to check the terms and conditions ");

                                }
                            },

                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.googlePlus, size: 35,
                                color: HexColor("#EC2D2F"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Google Plus","You tap on GooglePlus social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 5, color: HexColor("#40ABF0")),
                                  color: HexColor("#40ABF0"),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.twitter, size: 23,
                                  color: HexColor("#FFFFFF"),),
                              ),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Twitter","You tap on Twitter social icon.",context);
                                    },
                                  );
                                });
                              },
                            ),
                            SizedBox(width: 30.0,),
                            GestureDetector(
                              child: FaIcon(
                                FontAwesomeIcons.facebook, size: 35,
                                color: HexColor("#3E529C"),),
                              onTap: () {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog("Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

