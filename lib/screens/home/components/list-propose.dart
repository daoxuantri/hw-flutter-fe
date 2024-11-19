import 'package:flutter/material.dart';
import 'package:myproject/model/home/products.dart';
import '../bloc/home_bloc.dart';
import 'product_card_propose.dart';

class ListPropose extends StatelessWidget {
  final List<ProductDataModel> ratingProducts;
  final HomeBloc homeBloc;

  const ListPropose(
      {super.key, required this.ratingProducts, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: ratingProducts.length,
            itemBuilder: (context, index) {
              int currentIndex = index;
              return Container(
                margin: EdgeInsets.only(
                    right: currentIndex == ratingProducts.length - 1 ? 20 : 0),
                padding: const EdgeInsets.only(bottom: 15),  
                child: GestureDetector(
                  onTap: () {
                    // homeBloc.add(HomeProductClickedEvent(productId: ratingProducts[index].sId.toString()));
                  },
                  child: ProductCardPropose(
                    name: ratingProducts[index].name,
                    image: (ratingProducts[index].images != null && ratingProducts[index].images!.isNotEmpty) 
                      ? ratingProducts[index].images! 
                      : 'assets/images/notfoundimages.jpg', 
                    id: ratingProducts[index].sId ?? '', 
                    homeBloc: homeBloc,
                    price : ratingProducts[index].price,
                    sold: ratingProducts[index].sold
                    
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
