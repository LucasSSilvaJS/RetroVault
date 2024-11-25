import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:retrovault/components/copy.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/order.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final ScrollController _scrollController = ScrollController();

  void _showMyDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0XFFE7E7E7),
          title: Text(
            'Acompanhar envio',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF474646),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'The Smiths - The Queen is Dead',
                style: TextStyle(
                  color: Color(0xFF474646),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Em trânsito',
                style: TextStyle(
                  color: Color(0xFF474646),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                'Transportadora de São Paulo',
                style: TextStyle(
                  color: Color(0xFF474646),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                '26/12/2024',
                style: TextStyle(
                  color: Color(0xFF474646),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CopyTextWidget(textToCopy: "Olá mundo")
            ],
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o modal
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  void _showMyDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0XFFE7E7E7),
          title: Text(
            'Solicitar reembolso',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF474646),
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Você realmente deseja realizar essa operação?',
                textAlign: TextAlign.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Sim',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                        Size(90, 50),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFF0E7391),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Não',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                        Size(90, 50),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFFE07BB2),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o modal
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

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
                              'Minhas compras',
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
                          Order(
                            img: 'assets/img/smiths1.png',
                            title: 'The Smiths - The Queen is Dead',
                            price: 'R\$ 150,00',
                            date: '24/09/2023',
                            time: '17:00',
                          ),
                          ElevatedButton(
                            onPressed: () => _showMyDialog2(context),
                            child: Text(
                              'Solicitar reembolso',
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
                            onPressed: () => _showMyDialog1(context),
                            child: Text(
                              'Acompanhar envio',
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
                          Order(
                            img: 'assets/img/daftpunk.png',
                            title: 'Daft Punk',
                            price: 'R\$ 140,00',
                            date: '24/09/2023',
                            time: '17:00',
                          ),
                          Order(
                            img: 'assets/img/earthwindandfire.png',
                            title: 'Earth, Wind & Fire',
                            price: 'R\$ 140,00',
                            date: '24/09/2023',
                            time: '17:00',
                          ),
                          Order(
                            img: 'assets/img/michaeljackson.png',
                            title: 'Michael Jackson',
                            price: 'R\$ 140,00',
                            date: '24/09/2023',
                            time: '17:00',
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
