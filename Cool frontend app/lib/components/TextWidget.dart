import 'package:flutter/cupertino.dart';

import '../constants.dart';

class textWidget extends StatelessWidget {
  String headline='';

  textWidget(String s){
    headline=s;

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(headline,
        style: TextStyle(
            color: kBackGroundColor,
            fontWeight: FontWeight.bold,
            fontSize: 20

        ),
      ),
    );
  }
}

