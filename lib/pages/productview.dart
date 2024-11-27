import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/productcarousel.dart';
import 'package:retrovault/components/relatedproductscarousel.dart';
import 'package:retrovault/components/simpleinputfield.dart';
import 'package:retrovault/components/starrating.dart';

class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  double _productRating = 0.0; // Avaliação inicial do produto

  void _onRatingChanged(double rating) {
    setState(() {
      _productRating = rating; // Atualiza a avaliação quando o usuário clica
    });
  }

  // Controla se o texto deve ser truncado ou completo
  bool _isTextTruncated = true;

  final ScrollController _scrollController = ScrollController();

  // Texto completo para ser exibido ao clicar
  final String _fullText =
      'Um dos álbuns mais icônicos da década de 80, The Queen Is Dead marca o auge criativo dos The Smiths. Com letras poéticas e melancólicas de Morrissey, combinadas com as melodias brilhantes de Johnny Marr, o disco apresenta clássicos como "There Is a Light That Never Goes Out" e "Bigmouth Strikes Again". Uma obra-prima do indie rock britânico, essencial para qualquer coleção de vinil.';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color(0xFF2B2B2B),
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 75.0, // Ajuste a altura aqui
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Configurações',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListMenu(
              title: 'Página inicial',
              to: '/mainpage',
            ),
            ListMenu(
              title: 'Minhas compras',
              to: '/myorders',
            ),
            ListMenu(
              title: 'Carrinho de compra',
              to: '/shoppingcart',
            ),
            ListMenu(
              title: 'Lista de desejos',
              to: '/wishlist',
            ),
            ListMenu(
              title: 'Dados pessoais',
              to: '/perfilpage',
            ),
            ListMenu(
              title: 'Sair',
              color: Colors.red,
              to: '/login',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B2B2B),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            const Text(
              'Retro Vault',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/img/avatar.png'),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/Wallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          controller: _scrollController,
          children: [
            SizedBox(
              height: 20.0,
            ),
            ProductCarousel(),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      // Garante que o blur fique apenas no container
                      borderRadius: BorderRadius.circular(0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 44.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The Smiths - The Queen is Dead',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.37,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                size: 25.0,
                                color: Colors.yellow,
                              );
                            }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '598 avaliações | 3k vendas',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.47,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _isTextTruncated
                                ? _fullText.substring(0, 150) + '...'
                                : _fullText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.47,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isTextTruncated = !_isTextTruncated;
                              });
                            },
                            child: Text(
                              _isTextTruncated ? 'Ler mais' : 'Ler menos',
                              style: TextStyle(
                                color: Color(0xFF00B2C9),
                                fontSize: 14.47,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17.0,
                          ),
                          Text(
                            'Adicionar:',
                            style: TextStyle(
                              color: Color(0xFFF5A13B),
                              fontSize: 14.47,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFF0E7391),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/shoppingcart');
                                },
                                child: Text(
                                  'Carrinho',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFFE07BB2),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/wishlist');
                                },
                                child: Text(
                                  'Lista de desejo',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xFF0E7391),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/comunity');
                            },
                            child: Text(
                              'Comunidade',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            decoration: BoxDecoration(
                              color:
                                  Colors.black.withOpacity(0.20000000298023224),
                            ),
                          ),
                          SizedBox(
                            height: 17.0,
                          ),
                          Text(
                            'Produtos relacionados',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.37,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 17.0,
                          ),
                          RelatedProductsCarousel(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 2,
                            decoration: BoxDecoration(
                              color:
                                  Colors.black.withOpacity(0.20000000298023224),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Comentários',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.37,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SimpleInputField(hintText: 'Digite seu comentário'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Avaliação',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.37,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          StarRating(
                            initialRating: _productRating,
                            starCount: 5,
                            starColor: Colors.yellow,
                            onRatingChanged: _onRatingChanged,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  blurRadius: 0,
                                  offset: Offset(4, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada tincidunt auctor. Suspendisse venenatis sem nunc, a mollis quam tempor et. Donec vitae ultrices libero',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          Text(
                                            'Fulano',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(5, (index) {
                                        return Icon(
                                          Icons.star,
                                          size: 25.0,
                                          color: Colors.yellow,
                                        );
                                      }),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Responder',
                                        style: TextStyle(
                                          color: Color(0xFF0E7391),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  blurRadius: 0,
                                  offset: Offset(4, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Resposta',
                                            style: TextStyle(
                                              color: Color(0xFFE07BB2),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada tincidunt auctor. Suspendisse venenatis sem nunc, a mollis quam tempor et. Donec vitae ultrices libero',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          Text(
                                            'Fulano',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
