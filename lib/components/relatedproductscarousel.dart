import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RelatedProductsCarousel extends StatefulWidget {
  @override
  State<RelatedProductsCarousel> createState() =>
      _RelatedProductsCarouselState();
}

class _RelatedProductsCarouselState extends State<RelatedProductsCarousel> {
  final List<String> images = [
    "assets/img/daftpunk.png",
    "assets/img/michaeljackson.png",
    "assets/img/earthwindandfire.png",
  ];

  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 135.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.3,
          ),
          items: images.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        width: 78,
                        height: 78,
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
                      ),
                      Text(
                        '140,00',
                        style: TextStyle(
                          color: Color(0xFF0E7391),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 15.0,
                            color: Colors.yellow,
                          );
                        }),
                      ),
                    ],
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
