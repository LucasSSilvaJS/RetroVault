import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final String? title;
  final String? to;
  final Color? color;

  const ListMenu({
    required this.title,
    required this.to,
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
          Navigator.pushNamed(context, to!); // Fecha o Drawer
        },
      ),
    );
  }
}
