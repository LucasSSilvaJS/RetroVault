import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/productcarousel.dart';
import 'package:retrovault/components/relatedproductscarousel.dart';
import 'package:retrovault/components/simpleinputfield.dart';
import 'package:retrovault/components/starrating.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
            ListMenu(title: 'Minhas compras'),
            ListMenu(title: 'Carrinho de compra'),
            ListMenu(title: 'Lista de desejos'),
            ListMenu(title: 'Dados pessoais'),
            ListMenu(title: 'Sair', color: Colors.red),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                          SizedBox(
                            height: 20.0,
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment
                                    .centerLeft, // Gradiente da esquerda para a direita
                                end: Alignment
                                    .centerRight, // Gradiente termina na direita
                                colors: [
                                  Color(0xFF0E7391), // Cor Azul
                                  Color(0xFFE07BB2), // Cor Rosa
                                ],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Lista de desejos',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(1, 1),
                                        color: Colors.black)
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
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
