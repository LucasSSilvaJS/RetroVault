import 'package:flutter/material.dart';
import 'package:retrovault/components/listmenu.dart';
import 'package:retrovault/components/simpleinputfield.dart';

class UserProfile {
  final String username;
  final String email;
  final String profileImageUrl;

  UserProfile(
      {required this.username,
      required this.email,
      required this.profileImageUrl});
}

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    // Dados estáticos para simular o perfil do usuário
    userProfile = UserProfile(
      username: 'John Doe',
      email: 'johndoe@example.com',
      profileImageUrl: 'https://via.placeholder.com/150', // Imagem de exemplo
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void _changeName(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Mudar nome',
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
                SimpleInputField(hintText: 'Nome do usuário atual'),
                SizedBox(
                  height: 10,
                ),
                SimpleInputField(hintText: 'Novo nome de usuário'),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Mudar',
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

    void _changePassword(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Alterar senha',
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
                SimpleInputField(hintText: 'Senha atual'),
                SizedBox(
                  height: 10,
                ),
                SimpleInputField(hintText: 'Nova senha'),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Mudar',
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

    void _editAddress(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Endereço 1',
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleInputField(hintText: 'Logradouro'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'País'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Estado'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Cidade'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Bairro'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Cep'),
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

    void _editCreditCard(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Cartão 1',
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleInputField(hintText: 'Titular'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Número do cartão'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Data de vencimento'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'Bandeira'),
                SizedBox(
                  height: 15,
                ),
                SimpleInputField(hintText: 'CVV'),
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

    void _viewCreditCard(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Cartões',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cartão  1',
                          style: TextStyle(
                            color: Color(0xFF474646),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'João da Silva',
                          style: TextStyle(
                            color: Color(0xFF474646),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          '1234 5678 9012 3456',
                          style: TextStyle(
                            color: Color(0xFF474646),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          '08/25',
                          style: TextStyle(
                            color: Color(0xFF474646),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/img/visa.png',
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Color(0xFF474646),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _editCreditCard(context),
                      child: Icon(
                        Icons.brush,
                        size: 20,
                        color: Color(0xFF474646),
                      ),
                    ),
                  ],
                ),
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

    void _viewAddress(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0XFFE7E7E7),
            title: Text(
              'Endereços',
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
                  'Endereço  1',
                  style: TextStyle(
                    color: Color(0xFF474646),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Avenida Hildebrando de Vasconcelos',
                  style: TextStyle(
                    color: Color(0xFF474646),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  'Dois Unidos, Recife, Pernambuco, Brasil',
                  style: TextStyle(
                    color: Color(0xFF474646),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  '52140005',
                  style: TextStyle(
                    color: Color(0xFF474646),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Color(0xFF474646),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _editAddress(context),
                      child: Icon(
                        Icons.brush,
                        size: 20,
                        color: Color(0xFF474646),
                      ),
                    ),
                  ],
                ),
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/Wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment
                          .centerLeft, // Gradiente da esquerda para a direita
                      end:
                          Alignment.centerRight, // Gradiente termina na direita
                      colors: [
                        Color(0xFF0E7391), // Cor Azul
                        Color(0xFFE07BB2), // Cor Rosa
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Dados pessoais',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(offset: Offset(1, 1), color: Colors.black)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 23),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage(userProfile.profileImageUrl),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Color(0xFF474646),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/img/camera-add1.png',
                            color: Colors.white,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  userProfile.username,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF000000),
                  ),
                ),
                Text(
                  userProfile.email,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 20),
                buildActionButton(
                  context,
                  'Mudar nome de usuário',
                  Color(0xFF0E7391),
                  () => _changeName(context),
                ),
                buildActionButton(
                  context,
                  'Alterar Senha',
                  Color(0xFF0E7391),
                  () => _changePassword(context),
                ),
                buildActionButton(
                  context,
                  'Endereços',
                  Color(0xFFE07BB2),
                  () => _viewAddress(context),
                ),
                buildActionButton(
                  context,
                  'Cartões',
                  Color(0xFFE07BB2),
                  () => _viewCreditCard(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton(
      BuildContext context, String text, Color color, VoidCallback action) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: ElevatedButton(
        onPressed: action,
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
}
