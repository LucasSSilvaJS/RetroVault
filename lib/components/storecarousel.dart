import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StoreCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  StoreCarousel({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<StoreCarousel> createState() => _StoreCarouselState();
}

class _StoreCarouselState extends State<StoreCarousel> {
  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 88.0,
            enableInfiniteScroll: true,
          ),
          items: widget.items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    if (item['title'] == 'The Smiths - The Queen is Dead') {
                      Navigator.pushNamed(context, '/productview');
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          Container(
                            width: 78.0,
                            height: 78.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(item['img']),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'].toString().length > 15
                                    ? item['title']
                                            .toString()
                                            .substring(0, 15) +
                                        '...'
                                    : item['title'].toString(),
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 83, 56, 56),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < (item['rating'] ?? 0)
                                        ? Icons.star
                                        : Icons.star_border,
                                    size: 12.0,
                                    color: index < (item['rating'] ?? 0)
                                        ? Colors.yellow
                                        : Colors.grey,
                                  );
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                item['price'] ?? 'R\$ 0.00',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      color: Color(0xFF000000),
                                    ),
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 20,
                                      color: Color(0xFF000000),
                                    ),
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 30,
                                      color: Color(0xFF000000),
                                    ),
                                  ],
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '${item['reviews'] ?? '0'} avaliações | ${item['sales'] ?? '0'} vendas',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  height: 1.0,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
