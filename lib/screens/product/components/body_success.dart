import 'package:myproject/model/products/product_data_model.dart';
import 'package:myproject/screens/product/bloc/product_bloc.dart';
import 'package:myproject/screens/product/components/images_product.dart';
import 'package:myproject/screens/product/components/productdetail/policy_sales.dart'; 
import 'package:myproject/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BodySuccess extends StatefulWidget {
  final ProductDataModel product; 
  
  const BodySuccess({super.key, required this.product });

  @override
  State<BodySuccess> createState() => _BodySuccessState();
}

class _BodySuccessState extends State<BodySuccess> {
  @override
  Widget build(BuildContext context) {
    String formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(widget.product.price);
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(0),
          getProportionateScreenWidth(0),
          getProportionateScreenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getFullWidth(),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(15),
                  getProportionateScreenWidth(20),
                  getProportionateScreenHeight(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesCreen(images : widget.product.images!),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      '$formattedPrice',
                      style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    //thuonghieu
                    Text(
                        widget.product.name ?? 'null',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Container(
              width: getFullWidth(),
              color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(10),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mô tả sản phẩm',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        )
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Text(
                        widget.product.description ?? 'null',
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                  
                      )
                    ],
                  ),
                ),
            ),
 
          ],
        ),
      ),
    );
  }
}


