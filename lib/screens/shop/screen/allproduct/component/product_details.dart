import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/screens/shop/screen/allproduct/bloc/product_bloc.dart';
import 'package:myproject/screens/shop/screen/allproduct/component/details.dart';
import 'package:myproject/screens/shop/screen/bloc/detail_bloc.dart';
import 'package:myproject/screens/shop/widget/title_text.dart';
import 'package:myproject/size_config.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  static String routeName ="/product-details";

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final DetailBloc detailBloc = DetailBloc();
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productId = ModalRoute.of(context)?.settings.arguments as String; 
    detailBloc.add(DetailInitialEvent(productId: productId));
    return BlocProvider(
      create: (context) => DetailBloc(),
      child: BlocConsumer<DetailBloc, DetailState>(
        bloc: detailBloc,
        listenWhen: (previous, current) => current is DetailActionState,
        buildWhen: (previous, current) => current is! DetailActionState,
        listener: (context, state) {
          // if (state is ProductPostClickedActionState) {
          //   // Navigator.pushNamed(context, DemandScreen.routeName,
          //   //     arguments: state.product);
          // }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case DetailLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DetailLoadedSuccessState:
              final successState = state as DetailLoadedSuccessState;
              return Scaffold( 
                appBar: AppBar(
                centerTitle: true,
                title: const TitlesTextWidget(
                  label: "Chi tiết sản phẩm",
                ),
              ),
                body: Detail(
                  product: successState.product
                ), 
              );
            case ProductErrorState:
              final errorState = state as ProductErrorState;
              return Scaffold(
                body: Center(child: Text(errorState.errorMessage)),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}