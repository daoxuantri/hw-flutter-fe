// import 'package:flutter/material.dart';
// import 'package:myproject/model/orders/data_order_model.dart';  
// import 'package:myproject/screens/shop/screen/view_order/bloc/view_bloc.dart';
// import 'package:myproject/screens/shop/screen/view_order/component/orders_card.dart';

// class OrderList extends StatelessWidget {
//   final List<Data>? listorders;
//   final ViewBloc viewBloc;

//   const OrderList({super.key, required this.listorders, required this.viewBloc});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Hiển thị 2 sản phẩm trên một hàng
//             mainAxisSpacing: 10, // Khoảng cách giữa các hàng
//             crossAxisSpacing: 10, // Khoảng cách giữa các cột
//             childAspectRatio: 0.7, // Tỉ lệ giữa chiều cao và chiều rộng của item
//           ),
//           itemCount: 1,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 // productBloc.add(
//                 //   ProductProductClickedEvent(
//                 //     productId: products[index].sId.toString(),
//                 //   ),
//                 // );
//               },
//               child: OrderCard(
//                 images: (products[index].images != null && products[index].images!.isNotEmpty)
//                     ? products[index].images!
//                     : 'assets/images/notfoundimages.jpg',
//                 name: products[index].name.toString(),
//                 price: products[index].price,
//                 sold: products[index].sold,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

 

import 'package:flutter/material.dart';
import 'package:myproject/model/orders/data_order_model.dart';
import 'package:myproject/screens/shop/screen/view_order/bloc/view_bloc.dart';
import 'package:myproject/screens/shop/screen/view_order/component/orders_card.dart'; 
class OrderList extends StatelessWidget {
  final List<Data>? listorders; 
  final ViewBloc viewBloc ;

  const OrderList({
    super.key,
    required this.listorders, required this.viewBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (listorders == null || listorders!.isEmpty) {
      return const Center(child: Text("Không có đơn đặt hàng nào."));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listorders!.length,
      itemBuilder: (context, index) {
        final order = listorders![index];

        return OrderCard(
          idUser: order.iduser ?? 'Không rõ',
          email: order.email ?? 'Không rõ',
          products: order.productItem ?? [],
          total: (order.total ?? 0).toDouble(),
          address: order.address ?? 'Không rõ',
          phone: order.phone ?? 'Không rõ',
          delivery: order.delivery ?? false,
          voidCallback: ()=> _showChangeDeliveryDialog(context, order),
        );
      },
    );
  }



  void _showChangeDeliveryDialog(BuildContext context, Data order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cập nhật trạng thái giao hàng"),
          content: const Text("Bạn muốn cập nhật trạng thái đơn hàng này?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Đóng dialog
              child: const Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                // Trạng thái "Đã giao"
                viewBloc.add(ViewUpdateStatusDeliveryEvent(
                  orderId: order.sId!,
                  statusDelivery: true,
                ));
                Navigator.pop(context); // Đóng dialog
              },
              child: const Text("Đã giao"),
            ),
            TextButton(
              onPressed: () {
                // Trạng thái "Đang trong quá trình vận chuyển"
                viewBloc.add(ViewUpdateStatusDeliveryEvent(
                  orderId: order.sId!,
                  statusDelivery: false,
                ));
                Navigator.pop(context); // Đóng dialog
              },
              child: const Text("Đang giao"),
            ),
          ],
        );
      },
    );
  }
}