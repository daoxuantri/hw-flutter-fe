 
import 'package:myproject/screens/forget_password/bloc/forget_password_bloc.dart';

class ScreenArguments{
  final ForgetPasswordBloc bloc;
  final String email;
  ScreenArguments(this.bloc, this.email);
}