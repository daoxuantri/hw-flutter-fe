import 'package:carousel_slider/carousel_slider.dart';
import 'package:myproject/components_buttons/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesCreen extends StatefulWidget {
  final dynamic images; // Có thể là String hoặc List<String>
  const ImagesCreen({super.key, required this.images});

  @override
  State<ImagesCreen> createState() => _ImagesCreenState();
}

class _ImagesCreenState extends State<ImagesCreen> {
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // Chuyển images thành danh sách nếu chỉ là chuỗi
    final List<String> imageList = widget.images is String
        ? [widget.images]
        : widget.images as List<String>;

    return Column(
      children: [
        if (imageList.length == 1) // Nếu chỉ có 1 hình ảnh
          Image.network(
            imageList[0], // Hiển thị hình ảnh đầu tiên
            height: 211,
            width: 350,
            fit: BoxFit.cover,
          )
        else // Nếu có nhiều hình ảnh
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: imageList.length, // Số lượng hình ảnh
            itemBuilder: (context, index, realIndex) {
              final banner = imageList[index]; // Lấy từng hình ảnh
              return Image.network(
                banner,
                height: 211,
                width: 350,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              aspectRatio: 10 / 2,
              viewportFraction: 0.8,
              height: 175,
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
        if (imageList.length > 1) // Hiển thị chỉ số nếu có nhiều hình ảnh
          Transform.scale(
            scale: 0.6,
            child: buildIndicator(imageList.length),
          ),
      ],
    );
  }

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: AppColor.colorFF3B30),
        activeIndex: activeIndex,
        count: count, // Số lượng hình ảnh
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
