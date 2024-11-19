 
import 'package:flutter/material.dart';
import 'package:myproject/components_buttons/bottom_navbar_home.dart';
import 'package:myproject/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:myproject/screens/forget_password/components/reset_password/reset_pass.dart';
import 'package:myproject/screens/forget_password/forget_password.dart';
import 'package:myproject/screens/home/home_screen.dart';
import 'package:myproject/screens/login_register/login/login_screen.dart';
import 'package:myproject/screens/login_register/register/sign_up_screen.dart';
import 'package:myproject/screens/product/product_screen.dart';
import 'package:myproject/screens/shop/screen/allproduct/allproduct_screen.dart';
import 'package:myproject/screens/shop/screen/edit_upload/edit_upload_product_form.dart';
import 'package:myproject/screens/shop/screen/view_order/view_oder_screen.dart'; 
import 'package:myproject/screens/shop/shop_screen.dart';
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

  //home
  HomeScreen.routeName : (context) => const HomeScreen(),
  //product
  ProductScreen.routeName :(context) => const ProductScreen(),
  //Navigator Bottom bar
  NavigatorBottomBarHome.routeName : (context) => const NavigatorBottomBarHome(),

  //darshboard
  DarshBoard.routeName : (context) => const DarshBoard(),
  EditOrUploadProductScreen.routeName : (context) => const EditOrUploadProductScreen(),
  ViewOrderScreen.routeName: (context) => const ViewOrderScreen(),
  AllProductScreen.routeName : (context) => const AllProductScreen(),
  // OrdersScreenFree.routeName : (context) => const EditOrUploadProductScreen(),
  // SearchScreen.routeName : (context) => const SearchScreen(),
  
  





};