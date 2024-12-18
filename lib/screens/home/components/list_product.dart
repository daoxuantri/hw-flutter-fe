import 'package:flutter/material.dart';
import 'package:myproject/model/home/products.dart';
import 'package:myproject/screens/home/bloc/home_bloc.dart';
import 'package:myproject/screens/home/components/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductDataModel> products;
  final HomeBloc homeBloc;

  const ProductList({super.key, required this.products, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Hiển thị 2 sản phẩm trên một hàng
            mainAxisSpacing: 10, // Khoảng cách giữa các hàng
            crossAxisSpacing: 10, // Khoảng cách giữa các cột
            childAspectRatio: 0.7, // Tỉ lệ giữa chiều cao và chiều rộng của item
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // homeBloc.add(
                //   HomeProductClickedEvent(
                //     productId: products[index].sId.toString(),
                //   ),
                // );
              },
              child: ProductCard(
                images: (products[index].images != null && products[index].images!.isNotEmpty)
                    ? products[index].images!
                    : 'assets/images/notfoundimages.jpg',
                name: products[index].name.toString(),
                price: products[index].price,
                sold: products[index].sold,
              ),
            );
          },
        ),
      ],
    );
  }
}
