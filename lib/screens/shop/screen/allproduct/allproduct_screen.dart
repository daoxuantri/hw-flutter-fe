import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/screens/home/components/text_title.dart';
import 'package:myproject/screens/shop/screen/allproduct/bloc/product_bloc.dart';
import 'package:myproject/screens/shop/screen/allproduct/component/product_list.dart';
import 'package:myproject/screens/shop/widget/title_text.dart';
import 'package:myproject/size_config.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  static String routeName ="/allproduct";

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final ProductBloc productBloc = ProductBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    productBloc.add(ProductInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => current is! ProductActionState,
      listener: (context, state) {
        // if (state is ProductErrorScreenToLoginState) {
        //   Navigator.pushNamed(context, LoginScreen.routeName);
        // }
        // if (state is ProductProductClickedState) {
        //   Navigator.pushNamed(context, ProductScreen.routeName,
        //       arguments: state.productId);
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductLoadingState:
            return const Center(child: CircularProgressIndicator(),);
          case ProductLoadedSuccessState:
            final successState = state as ProductLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const TitlesTextWidget(
                  label: "Tất cả sản phẩm",
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,10,10,10
                      ),
                      child: ProductList(products: successState.listproduct, productBloc: productBloc,),
                    ),

                   
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    )
                  ],
                ),
              ),
            );
            //xemlai
          // case HomeErrorState:
          //   final errorState = state as HomeErrorState;
          //   return Text('data'); 
          //   // return ErrorStateScreen(
          //   //   message: errorState.errorMessage,
          //   //   homeBloc: homeBloc,
          //   // );
          // case HomeErrorScreenToLoginState:
          //   return const SizedBox(
          //       child: Center(
          //     child: Text('HomeErrorScreenToLoginState'),
          //   ));
          default:
            return const SizedBox();
        }
      },
    );
  }
  
   
}
