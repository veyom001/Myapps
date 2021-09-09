
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'columnbutton.dart';

class BodyHandlerWidget extends StatelessWidget {
  const BodyHandlerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [

        Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),

            ),

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7,

            child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children :[

                  SizedBox(
                    height: 10,
                  ),


                  Text('    All Rooms',
                    style: TextStyle(
                      color:kBackGroundColor ,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(
                    height: 10,
                  ),



                  Columnbutton('assets/images/bed.svg','assets/images/room.svg','Bed room','4 Lights ','Living Room','2 Lights'),
                  Columnbutton('assets/images/kitchen.svg','assets/images/bathtube.svg','Kitchen','5 lights','Bathroom','1 Light '),
                  Columnbutton('assets/images/house.svg','assets/images/balcony.svg','Outdoor','5 Lights ','Balcony','2 lights '),
                ]

            )


        )

      ],

    );
  }
}
