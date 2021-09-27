
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prephuntneet/screens/home_screen.dart';
import 'package:prephuntneet/screens/login_screen.dart';
import 'package:prephuntneet/screens/register_screen.dart';
import 'package:prephuntneet/services/auth_services.dart';
import 'package:provider/provider.dart';




import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<AuthService>(create: (_) =>AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Login UI',
        theme: ThemeData(
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen(title: 'Flutter Login UI'),
      ),
    );
  }
}

