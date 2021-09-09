
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/Screens/screen2.dart';

class Columnbutton extends StatelessWidget {
  String link1='';
  String link2='';
  String header1='';
  String lightsin1='';
  String header2='';
  String lightsin2='';
  Columnbutton(String svgPicture1, String svgPicture2, String headline1, String light1, String headline2, String lights2,

      ){
    link1=svgPicture1;
    link2=svgPicture2;
    header1=headline1;
    lightsin1=light1;
    header2=headline2;
    lightsin2=lights2;
  }


  @override
  Widget build(BuildContext context) {
    return Row(




      children: [

        Padding(

          padding: const EdgeInsets.fromLTRB(10, 6, 6, 6),

          child: Container(

            decoration: BoxDecoration(
                borderRadius : BorderRadius.circular(1)

            ),


            width: MediaQuery.of(context).size.width*0.45,
            height: MediaQuery.of(context).size.height*(0.17),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(
                      Colors.white
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20),
                      )
                  )

              ),


              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen2()));


              },
              child:(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(link1),
                      SizedBox(
                          height: 10),
                      Text(header1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25
                        ),),

                      Text(lightsin1,
                          style: TextStyle(
                              color:Colors.yellow,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )
                      ),



                    ],
                  )


              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.45,
          height: MediaQuery.of(context).size.height*(0.17),

          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all<Color>(
                    Colors.white
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                )

            ),


            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen2()));

            }, child:(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SvgPicture.asset(link2),

                  SizedBox(
                      height: 10),
                  Text(header2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25
                    ),),

                  Text(lightsin2,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),




                ],
              )


          ),
          ),
        ),
      ],
    );
  }
}
