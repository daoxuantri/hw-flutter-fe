// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fmp_vendor/model/vendor_rest_model/demand/demand_model.dart';
// import 'package:fmp_vendor/screens/product/components/market/market_card.dart';
// import 'package:intl/intl.dart';

// class TabMarket extends StatefulWidget {
//   const TabMarket(
//       {super.key,
//       required this.listDemand0,
//       required this.listDemand1,
//       required this.colorProduct,
//       required this.categoryName,
//       required this.countryId,
//       required this.commissionValuePercent});

//   final List<DemandDataModel> listDemand0;
//   final List<DemandDataModel> listDemand1;
//   final String colorProduct;
//   final String categoryName;
//   final String countryId;
//   final int commissionValuePercent;

//   @override
//   State<TabMarket> createState() => _TabMarketState();
// }

// class _TabMarketState extends State<TabMarket> {
//   DateTime today = DateTime.now();
//   List<DemandDataModel> listDemand = [];
//   List<DemandDataModel> listDemandFill = [];
//   var chooseList = '';
//   var chooseType = '';
//   Color backgroundType = const Color(0xFFE3B98F);
//   @override
//   void initState() {
//     listDemand = widget.listDemand0;
//     listDemandFill = widget.listDemand0 + widget.listDemand1;
//     chooseList = 'Tin mua';
//     chooseType = 'Loại A';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Lọc'),
//               IconButton(
//                 onPressed: () {},
//                 color: Colors.black87,
//                 icon: const Icon(Icons.filter_list),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFD9D9D9)),
//                   onPressed: () async {
//                     await showDatePicker(
//                       context: context,
//                       initialDate: today,
//                       firstDate: DateTime(2022),
//                       lastDate: DateTime(2030),
//                     ).then((selectedDate) {
//                       if (selectedDate != null) {
//                         setState(() {
//                           today = selectedDate;
//                           listDemand = listDemandFill.where((element) {
//                             DateTime dateBefore =
//                                 DateTime.parse(element.dateFrom.toString());
//                             DateTime dateAfter =
//                                 DateTime.parse(element.dateTo.toString());
//                             return dateBefore.isBefore(selectedDate) &&
//                                 dateAfter.isAfter(selectedDate);
//                           }).toList();
//                           chooseList = 'Tất cả';
//                           chooseType = 'Loại A';
//                           backgroundType = const Color(0xFFE3B98F);
//                         });
//                       }
//                     });
//                   },
//                   icon: const Icon(Icons.date_range),
//                   label: Text(DateFormat("dd-MM-yyyy").format(today))),
//               Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => _onFillterbyType(),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: backgroundType),
//                       child: Text(chooseType),
//                     ),
//                     const SizedBox(width: 5),
//                     ElevatedButton(
//                       onPressed: () => _onFillterbyList(),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF35A5F1)),
//                       child: Text(chooseList),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListView.builder(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             itemCount: listDemand.length,
//             primary: false,
//             itemBuilder: (BuildContext context, int index) {
//               DemandDataModel demand = listDemand[index];
//               return MarketCard(
//                 demand: demand,
//                 colorProduct: widget.colorProduct,
//                 categoryName: widget.categoryName,
//                 countryId: widget.countryId, commissionValuePercent: widget.commissionValuePercent,
//               );
//             }),
//       ]),
//     );
//   }

//   void _onFillterbyList() {
//     showCupertinoModalPopup(
//         context: context,
//         builder: (BuildContext cont) {
//           return CupertinoActionSheet(
//             title: const Text('Lọc theo'),
//             actions: [
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonList(widget.listDemand0, 'Tin mua');
//                 },
//                 child: const Text('Tin mua'),
//               ),
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonList(widget.listDemand1, 'Tin bán');
//                 },
//                 child: const Text('Tin bán'),
//               )
//             ],
//             cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Hủy'),
//             ),
//           );
//         });
//   }

//   void _onButtonList(List<DemandDataModel> newListDemand, var newChooseList) {
//     setState(() {
//       listDemand = newListDemand;
//       chooseList = newChooseList;
//       chooseType = 'Loại A';
//       backgroundType = const Color(0xFFE3B98F);
//       today = DateTime.now();
//       Navigator.pop(context);
//     });
//   }

//   void _onFillterbyType() {
//     showCupertinoModalPopup(
//         context: context,
//         builder: (BuildContext cont) {
//           return CupertinoActionSheet(
//             title: const Text('Loại'),
//             actions: [
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonType(
//                       listDemandFill
//                           .where((element) => element.rank == 100)
//                           .toList(),
//                       'Loại A',
//                       const Color(0xFFE3B98F));
//                 },
//                 child: const Text('A'),
//               ),
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonType(
//                       listDemandFill
//                           .where((element) => element.rank == 90)
//                           .toList(),
//                       'Loại B',
//                       const Color(0XFFBEE8E6));
//                 },
//                 child: const Text('B'),
//               ),
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonType(
//                       listDemandFill
//                           .where((element) => element.rank == 80)
//                           .toList(),
//                       'Loại C',
//                       const Color(0xFFF68F8F));
//                 },
//                 child: const Text('C'),
//               ),
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonType(
//                       listDemandFill
//                           .where((element) => element.rank == 70)
//                           .toList(),
//                       'Loại D',
//                       const Color(0xFF8FD3FE));
//                 },
//                 child: const Text('D'),
//               ),
//               CupertinoActionSheetAction(
//                 onPressed: () {
//                   _onButtonType(widget.listDemand0 + widget.listDemand1,
//                       'Tất cả loại', const Color(0xFF35A5F1));
//                 },
//                 child: const Text('Tất cả loại'),
//               )
//             ],
//             cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Hủy'),
//             ),
//           );
//         });
//   }

//   void _onButtonType(List<DemandDataModel> newListDemand, var newChooseType,
//       Color newBackgroundType) {
//     setState(() {
//       listDemand = newListDemand;
//       chooseType = newChooseType;
//       backgroundType = newBackgroundType;
//       chooseList = 'Tất cả';
//       today = DateTime.now();
//       Navigator.pop(context);
//     });
//   }
// }
