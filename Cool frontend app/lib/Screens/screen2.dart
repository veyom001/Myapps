import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/components/TextWidget.dart';
import 'package:untitled1/components/modebutton.dart';

import '../constants.dart';

class Screen2 extends StatefulWidget {

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  double _currentSliderValue = 0.00;
  bool pressed1=false;
  bool pressed2=false;
  bool pressed3=false;
  Color selectedColor=Color(0xffff9b9b);

  Color box1=Colors.white;
  Color box2=Colors.white;
  Color box3=Colors.white;
  Color ActiveBoxColor=Color(0xff093b7b);
  bool box1Active=false;
  bool box2Active=false;
  bool box3Active=false;
  ElevatedButton ListViewButton (String iconlink,String headline,bool Passed) {


  return ElevatedButton(

  style : ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return ActiveBoxColor;
        return Colors.white;
      },
    ),

  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  )
  ),


  ),

  onPressed: (){

        setState(() {

          Passed=!Passed;


        });



  }, child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  SvgPicture.asset(iconlink,
  color: kBackGroundColor,
  ),
  SizedBox(
  width: 5,
  ),
  Text(headline,
  style: TextStyle(
  color:kBackGroundColor,
  fontWeight: FontWeight.bold
  ),
  ),
  ],

  ),
  );
  }


  ElevatedButton circleWithcolor(Color color){



  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),


    ),
    onPressed: () {
      setState(() {
        selectedColor=color;

      });
    },
    child: CircleAvatar(

    radius: 30,
    backgroundColor:color,
    ),
  );

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: kBackGroundColor,

        body: Center(
          child: Column(
            children: [

              Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,


                    children: [
                      SizedBox(
                        height: 20,
                      ),


                      Center(
                        child: Row(
                          children: [


                            Padding(

                              padding: const EdgeInsets.only(left:20),

                              child: Text('Bed \n'
                                  'Room',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.2,
                            ),

                            Container(
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [


                                        SvgPicture.asset('assets/images/light'+' '+'bulb.svg',
                                          color:selectedColor.withOpacity(_currentSliderValue),

                                          ),
                                        SvgPicture.asset('assets/images/Group'+' '+'38.svg',
                                          ),
                                      ],
                                    )



                                  ],
                                )
                            ),
                          ],
                        ),
                      ),

                      Padding(

                        padding: const EdgeInsets.only(left:20),

                        child: Text('4 Lights',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height:50,
                        margin: EdgeInsets.only(left:20),

                        child: ListView(

                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ListViewButton('assets/images/bulb.svg','Main Light',box1Active),
                            SizedBox(
                              width: 20,
                            ),
                            ListViewButton('assets/images/furniture-and-household.svg','Desk lights',box2Active),
                            SizedBox(
                              width: 20,
                            ),
                            ListViewButton('assets/images/bed'+' '+'(1).svg','Bed',box3Active),


                          ],

                        ),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(

                        children: [
                          Container(



                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),

                              ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.6,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,


                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  textWidget('Intensity'),


                                 Container(


                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,


                                     children: [
                                       SvgPicture.asset('assets/images/solution2.svg'),


                                       Container(
                                         width: MediaQuery.of(context).size.width*0.8,
                                         child: Slider(

                                           activeColor: Colors.yellow.shade200,
                                             inactiveColor: Colors.yellow.shade200,




                                             value: _currentSliderValue,
                                             min: 0,
                                             max: 1,

                                             onChanged:(double value){
                                            setState((){
                                              _currentSliderValue=value;

                                            });
                                             }
                                         ),
                                       ),
                                       SvgPicture.asset('assets/images/solution1.svg',
                                       color: Colors.yellow.withOpacity(_currentSliderValue),



                                       )
                                     ],
                                   ),
                                 ),
                                  textWidget('Color'),

                                  Container(
                                    height:50,


                                    child: ListView(
                                      padding: EdgeInsets.all(8),

                                      scrollDirection: Axis.horizontal,
                                      children: <Widget>[



                                        circleWithcolor(Color(0xffff9b9b)),
                                        circleWithcolor(Color(0xff94eb9e)),
                                        circleWithcolor(Color(0xff94caeb)),
                                        circleWithcolor(Color(0xffa594eb)),

                                        circleWithcolor(Color(0xffde94eb)),
                                        circleWithcolor(Color(0xffebd094)),



                                      ],

                                    ),

                                  ),
                                  textWidget('Scenes'),
                                  SizedBox(
                                    height: 20,
                                  ),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      ModeButtons('Birthday',Color(0xffff9b9b)),
                                      ModeButtons('Party', Color(0xffde94eb))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ModeButtons('Relax',Color(0xff94caeb)),

                                      ModeButtons('Fun',Color(0xff94eb9e))
                                    ],
                                  ),
                                  Stack(

                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.07,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset('assets/images/bulb.svg'),
                                            SvgPicture.asset('assets/images/Icon'+' '+'feather-home.svg'),
                                            SvgPicture.asset('assets/images/Icon'+' '+'feather-settings.svg'),


                                          ],
                                        ),
                                      ),

                                    ],
                                  )




                                ],
                              ),

                          )
                        ],

                      )







                    ],
                  ),

              ),

            ],
          ),
        ),



      ),

    );
  }
}
