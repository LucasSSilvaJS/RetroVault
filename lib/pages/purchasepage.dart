import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';

class Product {
  final String title;
  final String imageUrl;
  final double price;

  Product({required this.title, required this.imageUrl, required this.price});
}

Future<Product> fetchProduct() async {
  // Simulando um atraso de rede
  await Future.delayed(Duration(seconds: 2));
  // Retornando dados fictícios
  return Product(
    title: 'The Smiths - The Queen is Dead',
    imageUrl: 'assets/img/album-cover2.png',
    price: 150.00,
  );
}

class PurchaseScreen extends StatefulWidget {
  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  String selectedPaymentOption = 'Cartão';
  String selectedShippingOption = 'Envio padrão';
  late Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/Wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          FutureBuilder<Product>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final product = snapshot.data!;
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.85),
                          child: Image.asset(
                            product.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          product.title,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      buildSectionTitle('Opção de pagamento'),
                      buildRadioOptions(
                          ['Cartão', 'Boleto', 'Pix'], selectedPaymentOption,
                          (value) {
                        setState(() {
                          selectedPaymentOption = value!;
                        });
                      }),
                      buildSeparatorLine(),
                      SizedBox(height: 10),
                      buildSectionTitle('Selecionar localização'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '+ Adicionar localização',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF0E7391),
                          ),
                        ),
                      ),
                      buildSeparatorLine(),
                      SizedBox(height: 10),
                      buildSectionTitle('Opção de envio'),
                      buildRadioOptions(
                          ['Envio padrão', 'Envio expresso', 'Envio grátis'],
                          selectedShippingOption, (value) {
                        setState(() {
                          selectedShippingOption = value!;
                        });
                      }),
                      buildSeparatorLine(),
                      SizedBox(height: 15),
                      buildSectionTitle('Aplicar desconto'),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13.0, left: 8.0, right: 8.0),
                        child: Column(
                          children: [
                            buildDiscountInput(),
                            SizedBox(height: 15),
                            buildActionButton(
                                context, 'Comprar', Color(0xFF0E7391)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  Widget buildRadioOptions(
      List<String> options, String groupValue, Function(String?) onChanged) {
    return Column(
      children: options.map((option) {
        return Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: RadioListTile<String>(
            value: option,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Text(
              option,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildSeparatorLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(
        color: Colors.black.withOpacity(0.2),
        thickness: 4,
      ),
    );
  }

  Widget buildActionButton(BuildContext context, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/mainpage');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDiscountInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95, // 5% menor
        height: 24 * 0.75, // 25% menor
        decoration: BoxDecoration(
          color: Colors.white, // Cor de fundo branca
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Digite o código',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          ),
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PurchaseScreen(),
  ));
}
