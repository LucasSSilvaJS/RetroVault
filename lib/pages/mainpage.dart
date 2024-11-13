import 'package:flutter/material.dart';
import 'package:retrovault/components/storecarousel.dart';

class MainPage extends StatelessWidget {
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
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SearchInput(),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CustomDropdownButton(
                    hint: 'Filtrar por',
                    options: ['Preço', 'Melhor avaliados', 'Em promoção'],
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CustomDropdownButton(
                    hint: 'Categorias',
                    options: ['Livros', 'Vinil', 'Roupas'],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Title(
              name: 'Em destaque',
            ),
            SizedBox(
              height: 10.0,
            ),
            StoreCarousel(
              items: [
                {
                  'title': 'The Dark Side of the Moon - Pink Floyd',
                  'price': 'R\$ 350.00',
                  'reviews': '850',
                  'sales': '5k',
                  'rating': 5,
                },
                {
                  'title': 'Abbey Road - The Beatles',
                  'price': 'R\$ 420.00',
                  'reviews': '1.2k',
                  'sales': '6k',
                  'rating': 5,
                },
                {
                  'title': 'Back to Black - Amy Winehouse',
                  'price': 'R\$ 280.00',
                  'reviews': '750',
                  'sales': '3.5k',
                  'rating': 4,
                },
                {
                  'title': 'Thriller - Michael Jackson',
                  'price': 'R\$ 390.00',
                  'reviews': '1.8k',
                  'sales': '8k',
                  'rating': 5,
                },
                {
                  'title': 'Nevermind - Nirvana',
                  'price': 'R\$ 320.00',
                  'reviews': '950',
                  'sales': '4k',
                  'rating': 4,
                },
                {
                  'title': 'Rumours - Fleetwood Mac',
                  'price': 'R\$ 300.00',
                  'reviews': '600',
                  'sales': '2.8k',
                  'rating': 5,
                },
                {
                  'title': 'Hotel California - Eagles',
                  'price': 'R\$ 340.00',
                  'reviews': '1k',
                  'sales': '5k',
                  'rating': 5,
                },
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Title(
              name: 'Novidades',
            ),
            SizedBox(
              height: 10.0,
            ),
            StoreCarousel(
              items: [
                {
                  'title': 'Super Mario Bros - NES',
                  'price': 'R\$ 250.00',
                  'reviews': '2k',
                  'sales': '12k',
                  'rating': 5,
                },
                {
                  'title': 'The Legend of Zelda - NES',
                  'price': 'R\$ 300.00',
                  'reviews': '1.5k',
                  'sales': '9k',
                  'rating': 5,
                },
                {
                  'title': 'Street Fighter II - SNES',
                  'price': 'R\$ 220.00',
                  'reviews': '1.2k',
                  'sales': '6k',
                  'rating': 5,
                },
                {
                  'title': 'Sonic the Hedgehog - Sega Genesis',
                  'price': 'R\$ 180.00',
                  'reviews': '850',
                  'sales': '5k',
                  'rating': 4,
                },
                {
                  'title': 'Mega Man 2 - NES',
                  'price': 'R\$ 270.00',
                  'reviews': '1.3k',
                  'sales': '7k',
                  'rating': 5,
                },
                {
                  'title': 'Final Fantasy VII - PlayStation 1',
                  'price': 'R\$ 400.00',
                  'reviews': '3k',
                  'sales': '15k',
                  'rating': 5,
                },
                {
                  'title': 'Castlevania: Symphony of the Night - PlayStation 1',
                  'price': 'R\$ 350.00',
                  'reviews': '2.5k',
                  'sales': '8k',
                  'rating': 5,
                },
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Title(
              name: 'Mais vendidos',
            ),
            SizedBox(
              height: 10.0,
            ),
            StoreCarousel(
              items: [
                {
                  'title': 'Toy Story - VHS',
                  'price': 'R\$ 120.00',
                  'reviews': '3k',
                  'sales': '20k',
                  'rating': 5,
                },
                {
                  'title': 'Monsters, Inc. - VHS',
                  'price': '140.00',
                  'reviews': '2.5k',
                  'sales': '18k',
                  'rating': 5,
                },
                {
                  'title': 'Finding Nemo - VHS',
                  'price': 'R\$ 130.00',
                  'reviews': '3.2k',
                  'sales': '22k',
                  'rating': 4,
                },
                {
                  'title': 'The Incredibles - VHS',
                  'price': 'R\$ 150.00',
                  'reviews': '2k',
                  'sales': '14k',
                  'rating': 5,
                },
                {
                  'title': 'Up - VHS',
                  'price': 'R\$ 160.00',
                  'reviews': '1.8k',
                  'sales': '12k',
                  'rating': 5,
                },
                {
                  'title': 'Cars - VHS',
                  'price': 'R\$ 110.00',
                  'reviews': '2.1k',
                  'sales': '15k',
                  'rating': 4,
                },
                {
                  'title': 'Ratatouille - VHS',
                  'price': 'R\$ 125.00',
                  'reviews': '2.3k',
                  'sales': '17k',
                  'rating': 5,
                },
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  String? name;

  Title({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        name!,
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontFamily: 'Inter',
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          shadows: [
            Shadow(
              // Sombra à esquerda
              offset: Offset(-1.5, -1.5),
              color: Colors.black,
            ),
            Shadow(
              // Sombra à direita
              offset: Offset(1.5, -1.5),
              color: Colors.black,
            ),
            Shadow(
              // Sombra abaixo à esquerda
              offset: Offset(-1.5, 1.5),
              color: Colors.black,
            ),
            Shadow(
              // Sombra abaixo à direita
              offset: Offset(1.5, 1.5),
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final String? title;
  final Color? color;

  const ListMenu({
    required this.title,
    this.color = const Color(0xFF474646),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: color,
        title: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        onTap: () {
          // Fechar o Drawer
          Navigator.of(context).pop(); // Fecha o Drawer
        },
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Pesquisar',
        prefixIcon: Icon(Icons.search), // Ícone da lupa
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Bordas arredondadas
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 16), // Ajuste do padding
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  final String hint;
  final List<String> options;

  const CustomDropdownButton({
    Key? key,
    required this.hint,
    required this.options,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButton<String>(
        value: selectedOption,
        hint: Text(
          widget.hint,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        dropdownColor: Colors.black,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }).toList(),
      ),
    );
  }
}
