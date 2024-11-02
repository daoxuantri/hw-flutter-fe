 
import 'package:flutter/material.dart';
import 'package:myproject/model/products/product_data_model.dart';
import '../bloc/home_bloc.dart';
// import 'flower_card_propose.dart';

class ListPropose extends StatelessWidget {
  final List<ProductDataModel> products;
  final HomeBloc homeBloc;

  const ListPropose(
      {super.key, required this.products, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              int currentIndex = index;
              return Container(
                margin: EdgeInsets.only(
                    right: currentIndex == products.length - 1 ? 20 : 0),
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  // onTap: () {
                  //   homeBloc.add(HomeProductClickedEvent(productId: products[index].id.toString()));
                  // },
                  // child: FlowerCardPropose(
                  //   name: products[index].name,
                  // image: (products[index].images != null && products[index].images!.isNotEmpty) 
                  //     ? products[index].images![0] // Kiểm tra nếu mảng images có ít nhất 1 phần tử
                  //     : 'assets/images/notfoundimages.jpg', 
                  // id: products[index].sId ?? '', 
                  // homeBloc: homeBloc,
                  // ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
