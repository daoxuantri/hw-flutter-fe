import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/routes.dart';
import 'package:myproject/screens/splash/splash_screen.dart';
import 'package:myproject/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Ecommerce Electronics',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
        
    );
  }
}
