 
import 'package:flutter/material.dart';
import 'package:myproject/login_register/login/login_screen.dart';
import 'package:myproject/screens/splash/splash_screen.dart';

final Map<String , WidgetBuilder> routes ={
  //splash
  SplashScreen.routeName : (context) => const SplashScreen(),

  //login
  LoginScreen.routeName :  (context) => const LoginScreen(),
  





};