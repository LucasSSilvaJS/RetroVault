import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double initialRating; // Avaliação inicial (0 a 5)
  final int starCount; // Número de estrelas (normalmente 5)
  final Color starColor; // Cor das estrelas
  final Function(double)
      onRatingChanged; // Função callback para passar a avaliação

  const StarRating({
    Key? key,
    required this.initialRating,
    this.starCount = 5,
    this.starColor = Colors.amber,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating; // Inicializa com a avaliação passada
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < widget.starCount; i++) {
      Widget star;

      // Definir o ícone de estrela preenchida ou não preenchida
      if (i < _rating) {
        star = GestureDetector(
          onTap: () {
            setState(() {
              _rating = i + 1.0; // Atualiza a avaliação
              widget
                  .onRatingChanged(_rating); // Notifica a mudança de avaliação
            });
          },
          child: Icon(Icons.star, color: widget.starColor),
        );
      } else {
        star = GestureDetector(
          onTap: () {
            setState(() {
              _rating = i + 1.0; // Atualiza a avaliação
              widget.onRatingChanged(_rating);
            });
          },
          child: Icon(Icons.star_border, color: widget.starColor),
        );
      }

      // Adiciona cada estrela ao array
      stars.add(star);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: stars,
    );
  }
}
