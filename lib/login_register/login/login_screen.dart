 
import 'package:flutter/material.dart';
import 'package:myproject/login_register/login/components/body.dart';
import 'package:myproject/size_config.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Body(),
      ),
    );
  }
}