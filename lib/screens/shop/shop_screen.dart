import 'package:flutter/material.dart'; 
import 'package:myproject/screens/login_register/login/components/default_button.dart';
import 'package:myproject/screens/shop/components/child_card.dart';
import 'package:myproject/screens/shop/screen/allproduct/allproduct_screen.dart';  
import 'package:myproject/screens/shop/screen/edit_upload/edit_upload_product_form.dart';
import 'package:myproject/screens/shop/screen/view_order/view_oder_screen.dart';
import 'package:myproject/screens/shop/widget/title_text.dart';
import 'package:myproject/size_config.dart';


class DarshBoard extends StatefulWidget {
  static String routeName = "/dashboard";
  const DarshBoard({super.key});

  @override
  State<DarshBoard> createState() => _DarshBoardState();
}

class _DarshBoardState extends State<DarshBoard> {
   
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: "Trang chủ"), 
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(220),
                          child: GestureDetector(
                            onTap: (){ Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);},
                            child: MyWidget(linkimgs: 'assets/images/addproduct.png', title: 'Thêm sản phẩm '),
                          ),
                        ),
                        SizedBox(
                        width: getProportionateScreenHeight(5),
                        ),
                        Container(
                          height: getProportionateScreenHeight(220),
                          child: GestureDetector(
                            onTap: (){ Navigator.pushNamed(context, AllProductScreen.routeName);},
                            child: MyWidget(linkimgs: 'assets/images/allproduct.png', title: 'Xem tất cả'),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(220),
                          child: GestureDetector(
                            onTap: (){ Navigator.pushNamed(context, ViewOrderScreen.routeName);},
                            child: MyWidget(linkimgs: 'assets/images/view_order.png', title: 'Xem đơn hàng'),
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
        )
        
        );
  }
}