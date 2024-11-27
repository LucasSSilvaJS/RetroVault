import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/simpleinputfield.dart';
import 'package:retrovault/components/wishlistitem.dart';
import 'package:retrovault/pages/mainpage.dart';

class Comunity extends StatefulWidget {
  @override
  _ComunityState createState() => _ComunityState();
}

class _ComunityState extends State<Comunity> {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/img/smiths1.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Color(0xAF474646).withOpacity(0.75),
                                width: double.infinity,
                                height: 46,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'The Smiths - The Queen is Dead',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.37,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 44.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Membros',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF474646),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  ...List.generate(5, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundImage:
                                            AssetImage('assets/img/avatar.png'),
                                      ),
                                    );
                                  })
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Participar',
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
                                height: 15,
                              ),
                              Text(
                                'Fotografias',
                                style: TextStyle(
                                  color: Color(0xFF474646),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 71.64,
                                      height: 68,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/smiths4.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 71.64,
                                      height: 68,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/smiths5.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 71.64,
                                      height: 68,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/smiths6.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Adicionar',
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
                                height: 15,
                              ),
                              CustomDropdownButton(
                                hint: 'Temas',
                                options: [
                                  'Recomendações',
                                  'Reclamações',
                                  'Condições'
                                ],
                              ),
                              SizedBox(
                                height: 15,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                                        BorderRadius.circular(
                                                            50)),
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
                              SizedBox(
                                height: 15,
                              ),
                              SimpleInputField(hintText: 'Digite um comentário')
                            ],
                          ),
                        ),
                      ],
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
