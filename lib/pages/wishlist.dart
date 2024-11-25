import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/wishlistitem.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final ScrollController _scrollController = ScrollController();

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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                      offset: Offset(1, 1), color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          WishListItem(
                            title: 'The Smiths - The queen is dead',
                            imgTxt: 'assets/img/smiths1.png',
                            price: 'R\$ 150,00',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          WishListItem(
                            title: 'Daft Punk',
                            imgTxt: 'assets/img/daftpunk.png',
                            price: 'R\$ 140,00',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          WishListItem(
                            title: 'Earth, Wind & Fire',
                            imgTxt: 'assets/img/earthwindandfire.png',
                            price: 'R\$ 140,00',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          WishListItem(
                            title: 'Michael Jackson',
                            imgTxt: 'assets/img/michaeljackson.png',
                            price: 'R\$ 140,00',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/shoppingcart');
                            },
                            child: Text(
                              'Mover para o carrinho',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 50),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xFF0E7391),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Remover da lista de desejos',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(
                                Size(double.infinity, 50),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xFFE07BB2),
                              ),
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
