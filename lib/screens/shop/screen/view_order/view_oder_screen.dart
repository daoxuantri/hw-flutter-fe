import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/screens/shop/screen/view_order/bloc/view_bloc.dart';
import 'package:myproject/screens/shop/screen/view_order/component/order_list.dart';
import 'package:myproject/screens/shop/widget/title_text.dart';
import 'package:myproject/size_config.dart';

class ViewOrderScreen extends StatefulWidget {
  const ViewOrderScreen({super.key});
  static String routeName ="/allorder";

  @override
  State<ViewOrderScreen> createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  final ViewBloc viewBloc = ViewBloc();

  @override
  void initState() {
    viewBloc.add(ViewInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<ViewBloc, ViewState>(
      bloc: viewBloc,
      listenWhen: (previous, current) => current is ViewActionState,
      buildWhen: (previous, current) => current is! ViewActionState,
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
          case ViewLoadingState:
            return const Center(child: CircularProgressIndicator(),);
          case ViewLoadedSuccessState:
            final successState = state as ViewLoadedSuccessState;

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const TitlesTextWidget(
                  label: "Tất cả đơn đặt hàng",
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
                      padding: const EdgeInsets.fromLTRB(0,10,10,10),
                      child: OrderList(listorders: successState.listorder ),
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