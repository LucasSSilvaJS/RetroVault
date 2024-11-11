import 'package:flutter/material.dart';
import 'package:retrovault/components/textcarousel.dart';

class HomePage extends StatelessWidget {
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18, 0, 9),
                  child: Image.asset(
                    width: 200,
                    'assets/img/Logo.png',
                  ),
                ),
                TextCarousel(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Próximo',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
