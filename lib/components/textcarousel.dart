import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TextCarousel extends StatefulWidget {
  @override
  State<TextCarousel> createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  final List<String> messages = [
    "A plataforma Retro Vault é especializada na venda de produtos antigos e vintage, oferecendo uma experiência única para colecionadores e entusiastas de itens retrô e nostálgicos.",
    "O Retro Vault facilita o acesso a itens raros e nostálgicos, conectando colecionadores a produtos vintage cuidadosamente selecionados, em uma experiência personalizada e segura.",
    "Na Retro Vault, os usuários encontram discos de vinil raros, quadrinhos clássicos, consoles de videogame antigos, e muito mais, atendendo colecionadores de música, cultura pop e games vintage.",
  ];

  CarouselSliderController _carouselController = CarouselSliderController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          items: messages.map((message) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(index);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? const Color(0xFFE07BB2)
                      : const Color(0xFFCCCCCC),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
