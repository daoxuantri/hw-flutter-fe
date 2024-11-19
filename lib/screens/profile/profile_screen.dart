import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/screens/login_register/login/components/default_button.dart';
import 'package:myproject/screens/login_register/login/login_screen.dart';
import 'package:myproject/screens/profile/bloc/profile_bloc.dart';
import 'package:myproject/security_user/secure_storage_user.dart';
import 'package:myproject/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String routeName ="/profile";


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    // TODO: implement initState
    profileBloc.add(ProfileInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, current) => current is ProfileActionState,
      buildWhen: (previous, current) => current is! ProfileActionState,
      listener: (context, state) {
        // if (state is HomeErrorScreenToLoginState) {
        //   Navigator.pushNamed(context, LoginScreen.routeName);
        // }
        // if (state is HomeProductClickedState) {
        //   Navigator.pushNamed(context, ProductScreen.routeName,
        //       arguments: state.productId);
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileLoadingState:
            return const Center(child: CircularProgressIndicator(),);
          case ProfileLoadedSuccessState:  
            return Scaffold(
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(25),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(15)),
                      child: Container(
                        child: DefaultButton(
                          text: 'Logout',
                          press: () async {
                            await UserSecurityStorage.deleteAll();
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          }
                        ),
                      )
                    ),
                  ],
                ),
              ),
            );
            //xemlai
          case ProfileErrorState:
            final errorState = state as ProfileErrorState;
            return Text('data'); 
          default:
            return const SizedBox();
        }
      },
    );
  }
  
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1.5,
      title: Center(child: Text('Tất cả sản phẩm'),)
    );
  }
}