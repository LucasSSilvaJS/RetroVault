import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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

                // BOTÃO "ENTRAR"
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar',
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

                // TEXTO ABAIXO DO BOTÃO
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Não possui uma conta? ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0XFFFFFFFF),
                              ),
                            ),
                            Text(
                              'Cadastre-se!',
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
