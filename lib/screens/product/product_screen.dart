import 'package:myproject/components_buttons/bottom_navbar_home.dart'; 
import 'package:myproject/screens/product/components/body_success.dart';
import 'package:myproject/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "/product";

  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductBloc productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    productBloc.add(ProductInitialEvent(productId: productId));
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: BlocConsumer<ProductBloc, ProductState>(
        bloc: productBloc,
        listenWhen: (previous, current) => current is ProductActionState,
        buildWhen: (previous, current) => current is! ProductActionState,
        listener: (context, state) {
          if (state is ProductPostClickedActionState) {
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case ProductLoadingState:
              return const Center(
                child: Text('Doi xiu'),
              );
            case ProductLoadedSuccessState:
              final successState = state as ProductLoadedSuccessState;
              return Scaffold(
                appBar: buildAppBar(),
                body: BodySuccess(
                  product: successState.product
                ),
                bottomNavigationBar: buildBottomAppBar(),
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

  AppBar buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false, // Tắt tự động hiển thị nút quay lại của AppBar
    elevation: 1.5,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded, size: 25), // Nút quay lại
      onPressed: () {
        Navigator.pop(context); // Quay lại trang trước
      },
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.home_outlined, size: 30,), // Biểu tượng Home
        onPressed: () {
          Navigator.pushReplacementNamed(context, NavigatorBottomBarHome.routeName); // Điều hướng về trang Home
        },
      ),
    ],
  );
}
Widget buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Center( 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add to cart action
              },
              child: Text('Chỉnh sửa dữ liệu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
     
    );
  }

}




