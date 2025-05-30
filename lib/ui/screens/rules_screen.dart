import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Заголовок "Быки и коровы"
            SizedBox(
              height: 130,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -20,
                    child: FittedBox(
                      child: Text(
                        'Быки и',
                        style: TextStyle(
                          fontSize: screenWidth > 350 ? 64 : 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sclate',
                          letterSpacing: 2.0,
                          color: const Color.fromARGB(255, 31, 31, 31),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: FittedBox(
                      child: Text(
                        'коровы',
                        style: TextStyle(
                          fontSize: screenWidth > 350 ? 64 : 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sclate',
                          letterSpacing: 2.0,
                          color: const Color.fromARGB(255, 31, 31, 31),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Заголовок "Правила"
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Правила',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PublicPixel',
                  color: Colors.black,
                ),
              ),
            ),

            // Правила
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10),
                      Text(
                        '1. Загаданное число',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PublicPixel',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8), // Отступ именно под текст
                      Text(
                        'Компьютер выбирает 4-значное число из неповторяющихся цифр (0–9).',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Gilroy',
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        '2. Ваш ход',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PublicPixel',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Вводите свою 4-значную комбинацию (можно начинать с 0, например 0123).',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Gilroy',
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        '3. Получите подсказки',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PublicPixel',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'После каждой попытки вы увидите:\n'
                        '🐂 Быков — цифры, угаданные и стоящие на своих местах\n'
                        '🐄 Коров — цифры, которые есть в числе, но стоят не на своих местах',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Gilroy',
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        '4. У вас есть 10 попыток',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'PublicPixel',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
            ),

            // Логотип снизу
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
