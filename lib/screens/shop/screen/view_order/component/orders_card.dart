
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myproject/model/orders/product_item_model.dart';
import 'package:myproject/size_config.dart';  


class OrderCard extends StatelessWidget {
  final String idUser;
  final String email;
  final List<ProductItem> products;
  final double total;
  final String address;
  final String phone;
  final bool delivery;

  const OrderCard({
    super.key,
    required this.idUser,
    required this.email,
    required this.products,
    required this.total,
    required this.address,
    required this.phone,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID Người dùng: $idUser"),
            Text("Email: $email"),
            const Divider(),
            const Text("Sản phẩm:"),
            ...products.map((product) => ListTile(
                  leading: Image.network(
                    product.images ?? 'assets/images/notfoundimages.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name ?? 'Không rõ'),
                  subtitle: Text(
                    "Số lượng: ${product.quantity} - Giá: ${product.price}đ",
                  ),
                )),
            const Divider(),
            Text("Tổng: $total đ"),
            Text("Địa chỉ: $address"),
            Text("Số điện thoại: $phone"),
            Text("Giao hàng: ${delivery ? 'Đã giao' : 'Chưa giao'}"),
          ],
        ),
      ),
    );
  }
}