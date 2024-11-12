import 'package:flutter/material.dart';

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
        child: Center(
          child: Column(
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
              )
            ],
          ),
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
