// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:fmp_vendor/components/colors.dart';
// import 'package:fmp_vendor/helper/change.dart';
// import 'package:fmp_vendor/model/vendor_rest_model/demand/demand_model.dart';
// import 'package:fmp_vendor/screens/product/bloc/product_bloc.dart';
// import 'package:fmp_vendor/screens/product/components/market/create_order_screen.dart';
// import 'package:fmp_vendor/size_config.dart';

// class FullDetailInfomation extends StatefulWidget {
//   const FullDetailInfomation(
//       {super.key,
//       required this.demand,
//       required this.colorProduct,
//       required this.categoryName,
//       required this.countryId,
//       required this.commissionValuePercent});
//   final DemandDataModel demand;
//   final String colorProduct;
//   final String categoryName;
//   final String countryId;
//   final int commissionValuePercent;

//   @override
//   State<FullDetailInfomation> createState() => _FullDetailInfomationState();
// }

// class _FullDetailInfomationState extends State<FullDetailInfomation> {
//   late int quantity;
//   late TextEditingController _controller;

//   @override
//   void initState() {
//     quantity = widget.demand.minQuantity!;
//     _controller = TextEditingController();
//     _controller.text = quantity.toString();
//     super.initState();
//   }

//   @override
//   void deactivate() {
//     _controller.dispose();
//     super.deactivate();
//   }

//   void increase() {
//     if (quantity < widget.demand.quantity!) {
//       setState(() {
//         quantity += 1;
//       });
//     }
//   }

//   void decrease() {
//     if (quantity > widget.demand.minQuantity!) {
//       setState(() {
//         quantity--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var typeText = (widget.demand.type == 0) ? 'Mua' : 'Bán';
//     var rankText = (widget.demand.rank == 100)
//         ? 'A'
//         : (widget.demand.rank == 90)
//             ? 'B'
//             : (widget.demand.rank == 80)
//                 ? 'C'
//                 : 'D';
//     return Container(
//       margin: const EdgeInsets.only(top: 70),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//         ),
//         color: AppColor.colorWhite,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: getFullWidth(),
//               child: Center(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: AppColor.darkGray,
//                       borderRadius: BorderRadius.circular(5)),
//                   height: 5,
//                   width: 36,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '${widget.demand.productName}',
//                       textScaleFactor: 1,
//                       style: const TextStyle(
//                         overflow: TextOverflow.ellipsis,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 20,
//                     width: 20,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: ChangeData.ChangeColorIdToColors(
//                             widget.colorProduct.toString())),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
//                     decoration: BoxDecoration(
//                         color: (widget.demand.type == 0)
//                             ? Colors.greenAccent
//                             : Colors.red,
//                         borderRadius: BorderRadius.circular(50)),
//                     child: Text(
//                       typeText,
//                       style: TextStyle(color: AppColor.colorWhite),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                         width: getFullWidth(),
//                         height: getFullWidth() / 2,
//                         child: Image.network(
//                           widget.demand.productImageUrl!,
//                           fit: BoxFit.fitWidth,
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: Text.rich(
//                       TextSpan(
//                         text: 'Danh mục: ',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         children: [
//                           TextSpan(
//                               text: widget.categoryName,
//                               style: const TextStyle(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.normal))
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text.rich(
//                       TextSpan(
//                         text: 'Xuất xứ: ',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         children: [
//                           TextSpan(
//                               text: ChangeData.ChangeCountry(
//                                   widget.countryId.toString()),
//                               style: const TextStyle(
//                                   overflow: TextOverflow.ellipsis,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.normal))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Text.rich(
//                 TextSpan(
//                   text: 'Phí dịch vụ: ',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                         text: "${widget.commissionValuePercent} %",
//                         style: const TextStyle(
//                             overflow: TextOverflow.ellipsis,
//                             fontSize: 16,
//                             fontWeight: FontWeight.normal))
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Row(children: [
//                 const Text(
//                   'Chất lượng: ',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                       width: 35,
//                       height: 35,
//                       decoration: BoxDecoration(
//                           color: (rankText == 'A')
//                               ? const Color(0xFFE3B98F)
//                               : (rankText == 'B')
//                                   ? const Color(0XFFBEE8E6)
//                                   : (rankText == 'C')
//                                       ? const Color(0xFFF68F8F)
//                                       : const Color(0xFF8FD3FE),
//                           shape: BoxShape.circle),
//                       child: Center(
//                         child: Text(
//                           rankText,
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       )),
//                 )
//               ]),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Text.rich(
//                 TextSpan(
//                   text: 'Người bán: ',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                         text: widget.demand.vendorName,
//                         style: const TextStyle(
//                             overflow: TextOverflow.ellipsis,
//                             fontSize: 16,
//                             fontWeight: FontWeight.normal))
//                   ],
//                 ),
//               ),
//             ),
//             Divider(
//               color: AppColor.colorBlack,
//               thickness: 0.25,
//             ),
//             const Text(
//               'Mô tả:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Không thấy mô tả từ API',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.darkGray),
//             ),
//             const Spacer(),
//             widget.demand.type == 1
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 42,
//                         width: 42,
//                         child: OutlinedButton(
//                           style: ButtonStyle(
//                             shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             decrease();
//                             _controller.text = quantity.toString();
//                           },
//                           child: Text(
//                             '-',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColor.colorBlack,
//                                 fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 42,
//                         width: 100,
//                         child: TextField(
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.all(5),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 0, color: AppColor.colorWhite),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 0, color: AppColor.colorWhite),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 0, color: AppColor.colorWhite),
//                             ),
//                           ),
//                           controller: _controller,
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w600),
//                           onChanged: (value) {
//                             if (int.parse(value) < widget.demand.minQuantity!) {
//                               _controller.text =
//                                   widget.demand.minQuantity.toString();
//                             }
//                             if (int.parse(value) > widget.demand.quantity!) {
//                               _controller.text =
//                                   widget.demand.quantity.toString();
//                             }
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 42,
//                         width: 42,
//                         child: OutlinedButton(
//                           style: ButtonStyle(
//                             shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             increase();
//                             _controller.text = quantity.toString();
//                           },
//                           child: Text(
//                             '+',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColor.colorBlack,
//                                 fontSize: 20),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         ChangeData.changeStringToCurrency(
//                             widget.demand.price.toString()),
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       )
//                     ],
//                   )
//                 : const SizedBox(),
//             widget.demand.type == 1
//                 ? Container(
//                     margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                           minimumSize: const Size.fromHeight(50),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20))),
//                       onPressed: () {
//                         Navigator.pushNamed(
//                             context, CreateOrderScreen.routeName,
//                             arguments: args(
//                                 demandId: widget.demand.id!,
//                                 quantity: quantity,
//                                 price: widget.demand.price!,
//                                 maxQ: widget.demand.quantity!,
//                                 minQ: widget.demand.minQuantity!,
//                                 dateFrom: widget.demand.dateFrom!,
//                                 dateTo: widget.demand.dateTo!));
//                         // context.read<ProductBloc>().add(CreateOrderEvent(
//                         //     demandId: widget.demand.id!,
//                         //     productQuantity: quantity,
//                         //     transportMethod: 'self',
//                         //     requireDeliveryTimeTo: DateTime.now()));
//                       },
//                       icon: const Icon(Icons.shopping_cart_outlined),
//                       label: const Text('Mua ngay',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w600)),
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class args {
//   String demandId;
//   int quantity;
//   int price;
//   int maxQ;
//   int minQ;
//   String dateFrom;
//   String dateTo;
//   args({
//     required this.demandId,
//     required this.quantity,
//     required this.price,
//     required this.maxQ,
//     required this.minQ,
//     required this.dateFrom,
//     required this.dateTo,
//   });
// }
