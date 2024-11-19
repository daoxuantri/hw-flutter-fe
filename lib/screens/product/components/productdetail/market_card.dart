// import 'package:flutter/material.dart';
// import 'package:fmp_vendor/components/colors.dart';
// import 'package:fmp_vendor/helper/change.dart';
// import 'package:fmp_vendor/model/vendor_rest_model/demand/demand_model.dart';
// import 'package:fmp_vendor/screens/product/components/market/full_detail_infomation_product.dart';

// class MarketCard extends StatefulWidget {
//   // final String image;
//   // final String? nameVender;
//   // final int? quantity;
//   // final int? minimum;
//   // final int? price;
//   // final int? status;
//   // final int? type;
//   // final int? rank;
//   final DemandDataModel demand;
//   final String colorProduct;
//   final String categoryName;
//   final String countryId;
//   final int commissionValuePercent;

//   const MarketCard({
//     super.key,
//     required this.demand,
//     required this.colorProduct,
//     required this.categoryName,
//     required this.countryId,
//     required this.commissionValuePercent,
//   });

//   @override
//   State<MarketCard> createState() => _MarketCardState();
// }

// class _MarketCardState extends State<MarketCard> {
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
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//             isScrollControlled: true,
//             backgroundColor: AppColor.colorTransparent,
//             context: context,
//             builder: (context) => FullDetailInfomation(
//                   demand: widget.demand,
//                   colorProduct: widget.colorProduct,
//                   categoryName: widget.categoryName,
//                   countryId: widget.countryId,
//                   commissionValuePercent: widget.commissionValuePercent,
//                 ));
//       },
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//         margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 2,
//                 offset: Offset(0, 4),
//               )
//             ]),
//         child: Stack(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                     flex: 1,
//                     child: Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Image.network(
//                           widget.demand.productImageUrl!,
//                           fit: BoxFit.cover,
//                         ))),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Flexible(
//                               flex: 1,
//                               child: Text("Người $typeText"),
//                             ),
//                             Flexible(
//                               flex: 3,
//                               child: Text(
//                                 '${widget.demand.vendorName}',
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Flexible(flex: 2, child: Text("Số lượng")),
//                             Flexible(
//                                 flex: 3,
//                                 child: Text(
//                                   '${widget.demand.quantity}',
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Flexible(flex: 2, child: Text("Tối thiểu")),
//                             Flexible(
//                                 flex: 3,
//                                 child: Text(
//                                   '${widget.demand.minQuantity}',
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Flexible(flex: 2, child: Text("Giá")),
//                             Flexible(
//                                 flex: 3,
//                                 child: Text(
//                                   ChangeData.changeStringToCurrency(
//                                       widget.demand.price.toString()),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ))
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 2, horizontal: 20),
//                         decoration: BoxDecoration(
//                             color: (widget.demand.type == 0)
//                                 ? Colors.greenAccent
//                                 : Colors.red,
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Text(
//                           '$typeText',
//                           style: TextStyle(color: AppColor.colorWhite),
//                         ),
//                       ),
//                       // ElevatedButton(
//                       //   onPressed: () {},
//                       //   style: ElevatedButton.styleFrom(
//                       //     padding: const EdgeInsets.all(0),
//                       //     backgroundColor:
//                       //         (type == 0) ? Colors.greenAccent : Colors.red,
//                       //     shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(50.0)),
//                       //   ),
//                       //   child: Text(
//                       //     '$typeText',
//                       //     style: const TextStyle(height: 0.5),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Positioned(
//               left: 60,
//               child: Container(
//                   width: 35,
//                   height: 35,
//                   decoration: BoxDecoration(
//                       color: (rankText == 'A')
//                           ? const Color(0xFFE3B98F)
//                           : (rankText == 'B')
//                               ? const Color(0XFFBEE8E6)
//                               : (rankText == 'C')
//                                   ? const Color(0xFFF68F8F)
//                                   : const Color(0xFF8FD3FE),
//                       shape: BoxShape.circle),
//                   child: Center(
//                     child: Text(
//                       '$rankText',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
