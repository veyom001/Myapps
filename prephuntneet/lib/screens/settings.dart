import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showPassword=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        leading: IconButton(

          onPressed: (){

          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,

            ),
            onPressed: (){

            },



          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left:16,top:25,right:16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();

          },

          child: ListView(

            children: [
              Text("Edit Profile ", style: TextStyle(
                fontWeight:FontWeight.w500,
                fontSize: 25,

              ),
              ),
              SizedBox(
                height:15,

              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height:130,
                      decoration: BoxDecoration(
                       border: Border.all(
                         width:4,
                         color: Theme.of(context).scaffoldBackgroundColor,
                       ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2, blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset:Offset(0,10)
                          )
                        ],
                        shape : BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,

                          image: AssetImage('assets/images/myself.jpg')
                        )
                      ),

                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,

                      child:Container(
                        height:40,
                        width: 40,
                        decoration : BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color:Theme.of(context).scaffoldBackgroundColor,

                          ),




                        ),
                        child: Icon(
                          Icons.edit,
                          color:Colors.white,
                        ),

                      )
                    )

                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),

              buildTextField("Full name","Veyom Attwal",false),
              buildTextField("E-mail","veyom7777@gmail.com",false),
              buildTextField("Password","*******",true),
              buildTextField("Location ","Haryana , ynr ",false ),
              SizedBox(
                height: 35,

              ),
              Row(

                children: [





                ],
              )

            ],


          ),
        )
      )

    );
  }

  Widget buildTextField(String labelText, String placeholder, bool encryptText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: encryptText?showPassword:false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom:3),
                  labelText:labelText,
                  suffixIcon: encryptText?IconButton(
                      onPressed: (){
                        setState(() {
                          showPassword=!showPassword;

                        });

                  }, icon: showPassword?Icon(Icons.visibility):Icon(Icons.visibility_off)
                  ):
                      null,

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText:placeholder,
                  hintStyle:TextStyle(
                    fontSize:16,
                    fontWeight:FontWeight.bold,
                    color:Colors.black,

                  )

                ),


              ),
    );
  }
}
