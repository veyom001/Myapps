import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class baseArea extends StatelessWidget {
  const baseArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

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
    );
  }
}