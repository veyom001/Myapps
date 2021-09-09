
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModeButtons extends StatelessWidget {
  String header1="";
  late Color colrPas;

  ModeButtons(String s, Color color){
    colrPas=color;
    header1=s;


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/10,
      width: MediaQuery.of(context).size.width*0.4,

      child: ElevatedButton(
          style : ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),

              backgroundColor: MaterialStateProperty.all<Color>(
                  colrPas
              )

          ),



          onPressed: (){},
          child: Row(
            children: [
              SvgPicture.asset('assets/images/surface2.svg'),
              SizedBox(
                width: 10,
              ),
              Text(header1,
                style: TextStyle(

                    color: Colors.white,
                    fontSize: 20
                ),
              )
            ],
          )
      ),
    );
  }
}


