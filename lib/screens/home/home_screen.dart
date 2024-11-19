 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/screens/home/bloc/home_bloc.dart';
import 'package:myproject/screens/home/components/list-propose.dart';
import 'package:myproject/screens/home/components/list_product.dart';
import 'package:myproject/screens/home/components/text_title.dart';
import 'package:myproject/screens/login_register/login/login_screen.dart';
import 'package:myproject/screens/product/product_screen.dart';
import 'package:myproject/size_config.dart'; 
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
          Navigator.pushNamed(context, ProductScreen.routeName,
              arguments: state.productId);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(child: CircularProgressIndicator(),);
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;

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
                      child: const Text(
                        "Các sản phẩm nổi bật",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //Dựa theo đánh giá số sao
                    ListPropose(
                      ratingProducts: successState.ratingPropose,
                      homeBloc: homeBloc,
                    ),
                    const TextTitle(title: 'Tất cả sản phẩm'),
                    ProductList(products: successState.productsPropose, homeBloc: homeBloc),

                   
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    )
                  ],
                ),
              ),
            );
            //xemlai
          case HomeErrorState:
            final errorState = state as HomeErrorState;
            return Text('data'); 
            // return ErrorStateScreen(
            //   message: errorState.errorMessage,
            //   homeBloc: homeBloc,
            // );
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
      elevation: 1.5,
      title: Center(child: Text('Tất cả sản phẩm'),)
    );
  }
}





