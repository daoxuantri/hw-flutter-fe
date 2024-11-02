import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproject/screens/home/bloc/home_bloc.dart';
import 'package:myproject/screens/home/components/base_input.dart';
import 'package:myproject/screens/home/components/category.dart';
import 'package:myproject/screens/home/components/loading_error/error.dart';
import 'package:myproject/screens/home/components/slider_home.dart';
import 'package:myproject/size_config.dart';

import '../login_register/login/login_screen.dart';
import 'components/list-propose.dart';
import 'components/loading_error/loading.dart';
import 'components/text_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName ="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeErrorScreenToLoginState) {
          Navigator.pushNamed(context, LoginScreen.routeName);
        }
        if (state is HomeProductClickedState) {
          // Navigator.pushNamed(context, ProductScreen.routeName,
          //     arguments: state.productId);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Loading();
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderHome(),
                    const TextTitle(title: 'Danh mục'),
                    const Category(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(25),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(15)),
                      child: const Text(
                        "Đề xuất",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListPropose(
                      products: successState.productsPropose,
                      homeBloc: homeBloc,
                    ),

                    
                    // const TextTitle(title: 'Hoa sỉ'),
                    // FlowerList(products: successState.productsPropose),
                    // const TextTitle(title: 'Hoa lẻ'),
                    // FlowerList(products: successState.productsPropose),
                    // const TextTitle(title: 'Hoa thiết kế'),
                    // FlowerList(products: successState.productsPropose),
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    )
                  ],
                ),
              ),
            );
          case HomeErrorState:
            final errorState = state as HomeErrorState;
            return ErrorStateScreen(
              message: errorState.errorMessage,
              homeBloc: homeBloc,
            );
          case HomeErrorScreenToLoginState:
            return const SizedBox(
                child: Center(
              child: Text('HomeErrorScreenToLoginState'),
            ));
          default:
            return const SizedBox();
        }
      },
    );
  }
  
  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      title: const InputHome(),  // Thay thế bằng InputHome
    );
  }
}





//   AppBar buildAppBar() {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       elevation: 1,
//       title: Image.asset(
//         'assets/images/anhchinh.png',
//         height: 70,
//         width: 151,
//       ),
//       actions: [
//         GestureDetector(
//           onTap: () {
//             //  Navigator.pushNamed(context, ProductRegistrationScreen.routeName);
//           },
//           child: CircleAvatar(
//             backgroundColor: AppColor.colorF97616,
//             child: SvgPicture.asset(
//               'assets/images/IC_Shop.svg',
//               color: AppColor.colorWhite,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         GestureDetector(
//           onTap: () {
//             // Navigator.pushNamed(context, ChatBoxScreen.routeName);
//           },
//           child: Image.asset(
//             'assets/images/IC_Shop.png',
//             width: 30,
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         )
//       ],
//     );
//   }
// }







// import 'package:ecommerce_app_mobile/components_buttons/colors.dart';
// import 'package:ecommerce_app_mobile/screens/home/bloc/home_bloc.dart';
// import 'package:ecommerce_app_mobile/screens/home/components/category.dart';
// import 'package:ecommerce_app_mobile/screens/home/components/list_flower.dart';
// import 'package:ecommerce_app_mobile/screens/home/components/loading_error/error.dart';
// import 'package:ecommerce_app_mobile/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// import '../login_register/login/login_screen.dart';
// import 'components/base_input.dart';
// import 'components/list-propose.dart';
// import 'components/loading_error/loading.dart';
// import 'components/slider_home.dart';
// import 'components/text_title.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   static String routeName = "/home";

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final HomeBloc homeBloc = HomeBloc();

//   @override
//   void initState() {
//     homeBloc.add(HomeInitialEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return BlocConsumer<HomeBloc, HomeState>(
//       bloc: homeBloc,
//       listenWhen: (previous, current) => current is HomeActionState,
//       buildWhen: (previous, current) => current is! HomeActionState,
//       listener: (context, state) {
//         if (state is HomeErrorScreenToLoginState) {
//           Navigator.pushNamed(context, LoginScreen.routeName);
//         }
//         if (state is HomeProductClickedState) {
//           // Navigator.pushNamed(context, ProductScreen.routeName,
//           //     arguments: state.productId);
//         }
//       },
//       builder: (context, state) {
//         switch (state.runtimeType) {
//           case HomeLoadingState:
//             return const Loading();
//           case HomeLoadedSuccessState:
//             final successState = state as HomeLoadedSuccessState;
//             return Scaffold(
//               appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 elevation: 1,
//                 title: Column(
//                   children: [
//                     const SizedBox(height: 8), // Adjust spacing as needed
//                     const InputHome(),
//                   ],
//                 ),
//                 actions: [
//                   GestureDetector(
//                     onTap: () {
//                       //  Navigator.pushNamed(context, ProductRegistrationScreen.routeName);
//                     },
//                     child: CircleAvatar(
//                       backgroundColor: AppColor.colorF97616,
//                       child: SvgPicture.asset(
//                         'assets/images/IC_Shop.svg',
//                         color: AppColor.colorWhite,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigator.pushNamed(context, ChatBoxScreen.routeName);
//                     },
//                     child: Image.asset(
//                       'assets/images/IC_Shop.png',
//                       width: 30,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   )
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SliderHome(),
//                     const TextTitle(title: 'Danh mục'),
//                     const Category(),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(
//                           getProportionateScreenWidth(20),
//                           getProportionateScreenHeight(25),
//                           getProportionateScreenWidth(20),
//                           getProportionateScreenHeight(15)),
//                       child: const Text(
//                         "Đề xuất",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     // ListPropose(
//                     //   products: successState.productsPropose,
//                     //   homeBloc: homeBloc,
//                     // ),
//                     // const TextTitle(title: 'Hoa sỉ'),
//                     // FlowerList(products: successState.productsPropose),
//                     // const TextTitle(title: 'Hoa lẻ'),
//                     // FlowerList(products: successState.productsPropose),
//                     // const TextTitle(title: 'Hoa thiết kế'),
//                     // FlowerList(products: successState.productsPropose),
//                     SizedBox(
//                       height: getProportionateScreenHeight(100),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           case HomeErrorState:
//             final errorState = state as HomeErrorState;
//             return ErrorStateScreen(
//               message: errorState.errorMessage,
//               homeBloc: homeBloc,
//             );
//           case HomeErrorScreenToLoginState:
//             return const SizedBox(
//                 child: Center(
//               child: Text('HomeErrorScreenToLoginState'),
//             ));
//           default:
//             return const SizedBox();
//         }
//       },
//     );
//   }
// }
