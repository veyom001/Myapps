
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/components/BaseArea.dart';
import 'package:untitled1/components/bodyhandlerofscreen1.dart';
import 'package:untitled1/constants.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        backgroundColor: kBackGroundColor,
        body: Center(

          child: Column(
            children: [
              Container(

                height: MediaQuery.of(context).size.height*0.23,
                width: MediaQuery.of(context).size.width,
                child: Row(

                  children: [

                    Padding(

                      padding: const EdgeInsets.only(left:20),
                      child: Text('Control \n'
                      'Panel',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                    ),
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/user.jpg',),
                    )
                  ],
                )
              ),
              BodyHandlerWidget(),
              baseArea()
            ],

          ),

        )
    );
  }
}


