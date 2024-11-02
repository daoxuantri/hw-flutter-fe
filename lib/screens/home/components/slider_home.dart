import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../components_buttons/colors.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({super.key});

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner1.jpg',
    'assets/images/banner1.jpg',
    'assets/images/banner1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return Image.asset(
              urlImage,
              height: 211,
              width: 350,
            );
          },
          options: CarouselOptions(
            aspectRatio: 10 / 2,
            viewportFraction: 0.8,
            height: 220,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        Transform.scale(
          scale: 0.6,
          child: buildIndicator(),
        ),
      ],
    );
  }
  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: ExpandingDotsEffect(
        dotWidth: 15, activeDotColor: AppColor.colorFF3B30),
    activeIndex: activeIndex,
    count: urlImages.length,
  );
  void animateToSlide(int index) => controller.animateToPage(index);
}
