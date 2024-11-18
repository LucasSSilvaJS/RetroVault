import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductCarousel extends StatefulWidget {
  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final List<String> images = [
    "assets/img/smiths1.png",
    "assets/img/smiths2.png",
    "assets/img/smiths3.png",
  ];

  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 171.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.4,
          ),
          items: images.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 171,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
