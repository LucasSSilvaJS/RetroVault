import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImg extends StatefulWidget {
  @override
  State<ProfileImg> createState() => _ProfileImgState();
}

class _ProfileImgState extends State<ProfileImg> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Abre a galeria do dispositivo
      imageQuality: 50, // Reduz a qualidade da imagem para otimizar o tamanho do arquivo
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Armazena o caminho da imagem selecionada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0E7391),
              image: DecorationImage(
                image: AssetImage('assets/img/cassete.png'),
                fit: BoxFit.contain,
                alignment: Alignment.centerRight,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60,),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Bem-vindo(a), ', style: TextStyle(fontSize: 40.0, color: Colors.white,),),
                      const Text('Fulano!', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Color(0xFFF5A13B)),),
                      const Text('Adicione um foto de perfil', style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0XFF46A7B8).withOpacity(0.34),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                const Text('Nenhum arquivo adicionado'),
                const SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF00B2C9),
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Pular',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFF5A13B),
                        minimumSize: Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
