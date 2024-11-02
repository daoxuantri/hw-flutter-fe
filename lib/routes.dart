 
import 'package:flutter/material.dart';
import 'package:myproject/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:myproject/screens/forget_password/components/reset_password/reset_pass.dart';
import 'package:myproject/screens/forget_password/forget_password.dart';
import 'package:myproject/screens/login_register/login/login_screen.dart';
import 'package:myproject/screens/login_register/register/sign_up_screen.dart';
import 'package:myproject/screens/splash/splash_screen.dart';

final Map<String , WidgetBuilder> routes ={
  //splash
  SplashScreen.routeName : (context) => const SplashScreen(),

  //login
  LoginScreen.routeName :  (context) => const LoginScreen(),

  //sign up
  SignUpScreen.routeName :  (context) => const SignUpScreen(),

  //forget password
  ForgetPassWordScreen.routeName :(context) => const ForgetPassWordScreen(),
  
  IDEmail.routeName : (context) => const IDEmail(), 
  ResetPassScreen.routeName : (context) => const ResetPassScreen(), 
  





};