 
import 'package:flutter/material.dart';
import 'package:myproject/size_config.dart';

import 'category_card.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryCard(
            name: 'Hoa sỉ',
            srcImg: 'assets/images/c1.png',
            press: () {},
            color: const Color(0xFFADC8EB),
          ),
          CategoryCard(
            name: 'Hoa lẻ',
            srcImg: 'assets/images/c2.png',
            press: () {},
            color: const Color(0xFFFFCADD),
          ),
          CategoryCard(
            name: 'Hoa thiết kế',
            srcImg: 'assets/images/c3.png',
            press: () {},
            color: const Color(0xFFD9B9DA),
          ),
          CategoryCard(
            name: 'Tất cả',
            srcImg: 'assets/images/c4.png',
            press: () {},
            color: const Color(0xFFE3B98F),
          ),
        ],
      ),
    );
  }
}


// class Category extends StatelessWidget {
//   const Category({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Scrollbar(
//         thickness: 1,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               // NavigationUtil.pushNamed(
//               //   ProductByCategoryPage.route,
//               //   arguments: {
//               //     "categoryId": state.categories[index].id,
//               //     "categoryName": state.categories[index].name!
//               //   },
//               // );
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: CategoryCard(
//                 name: 'Hoa sỉ',
//                 srcImg: 'assets/images/c1.png',
//                 press: () {
//                   // NavigationUtil.pushNamed(
//                   //   ProductByCategoryPage.route,
//                   //   arguments: {
//                   //     "categoryId": state.categories[index].id,
//                   //     "categoryName": state.categories[index].name!
//                   //   },
//                   // );
//                 },
//                 color: const Color(0xFFADC8EB), // màu nền cho category
//               ),
//             ),
//           ),
//           separatorBuilder: (context, index) => const SizedBox(),
//           itemCount: 4, // số lượng category
//         ),
//       ),
//     );
//   }
// }
