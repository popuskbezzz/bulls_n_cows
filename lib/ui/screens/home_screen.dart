import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'rules_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Отступ сверху для заголовка (можно менять значение height)
              const SizedBox(height: 0),
              // Заголовок с точным позиционированием
              SizedBox(
                height: 130, // Общая высота блока заголовка
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Строка "Быки и"
                    const Positioned(
                      top: -20, // Положение первой строки
                      child: Text(
                        'Быки и',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 31, 31),
                          fontFamily: 'Sclate',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    // Строка "коровы"
                    Positioned(
                      top: 30, // Основной параметр! Уменьшайте это значение для поднятия слова "коровы" выше
                      child: const Text(
                        'коровы',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 31, 31),
                          fontFamily: 'Sclate',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 65),
              // Логотип на всю ширину
              SizedBox(
                width: MediaQuery.of(context).size.width, // Занимает всю ширину экрана
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 250, // Высоту можно регулировать
                  fit: BoxFit.cover, // Растягиваем по ширине
                ),
              ),
              const SizedBox(height: 20),

              // Кнопка "Играть"
              Transform.translate(
                offset: const Offset(0, 15), // Увеличивайте значение для большего смещения вниз
                child: SizedBox(
                  width: 250,
                  height: 80,
                  child: InkWell(
                    onTap: () async {
                      await Future.delayed(const Duration(milliseconds: 90));
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GameScreen(title: 'Игра Быки и Коровы'),
                          ),
                        );
                      }
                    },
                    splashColor: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/play.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Кнопка "Правила"
              Transform.translate(
                offset: const Offset(0, 25),
                child: SizedBox(
                  width: 1.45*200,
                  height: 1.45*60,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RulesScreen()),
                      );
                    },
                    splashColor: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/rules.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}