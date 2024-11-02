import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  final String name;
  final String srcImg;
  final VoidCallback press;
  final Color color;
  const CategoryCard({super.key, required this.name, required this.srcImg, required this.press, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Image.asset(
              '$srcImg',
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$name',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
