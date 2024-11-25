import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para acessar o Clipboard

class CopyTextWidget extends StatelessWidget {
  final String textToCopy;

  CopyTextWidget({required this.textToCopy});

  // Função para copiar o texto
  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
      // Exibir um Snackbar ou algum feedback ao usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Texto copiado!")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _copyToClipboard(context),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.copy, color: Color(0XFF0E7391)),
            SizedBox(width: 8),
            Text(
              textToCopy,
              style: TextStyle(color: Color(0XFF0E7391), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
