import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2B2B2B),
              image: DecorationImage(
                image: AssetImage('assets/img/Intro.png'),
                fit: BoxFit.contain,
                alignment: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              children: [
                // LOGO
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 9),
                  child: Image.asset(
                    width: 200,
                    'assets/img/Logo.png',
                  ),
                ),

                // CAMPO NOME USUÁRIO
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 9),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome de Usuário',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                // CAMPO EMAIL
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 9),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                // CAMPO SENHA
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 9),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),

                // CAMPO CONFIRMAR SENHA
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 9),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),

                // BOTÃO "CADASTRAR"
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profileimg');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF00B2C9),
                        minimumSize: const Size(double.infinity, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text(
                      'Próximo',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                // TEXTO ABAIXO DO BOTÃO
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Já possui uma conta? ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                            Text(
                              'Entrar!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFFF9215),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
