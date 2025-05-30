import 'package:flutter/material.dart';
import 'package:bulls_and_cows/app/game_logic.dart';
import 'package:bulls_and_cows/ui/widgets/number_pad.dart';
import 'package:bulls_and_cows/ui/widgets/attempt_item.dart';

class GameScreen extends StatefulWidget {
  final String title;

  const GameScreen({super.key, required this.title});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameLogic _gameLogic;
  late int _remainingAttempts;

  @override
  void initState() {
    super.initState();
    _gameLogic = GameLogic();
    _remainingAttempts = 10; // Максимум 10 попыток
  }

  void _onNumberPressed(String number) {
    setState(() {
      _gameLogic.addDigit(number);
    });
  }

  void _onSubmitPressed() {
    setState(() {
      _gameLogic.submitAttempt();
      if (_gameLogic.attempts.first.isWinner) { // Учитывай, что insert идет в начало
        _showVictoryDialog();
      } else {
        _remainingAttempts--;
        if (_remainingAttempts <= 0) {
          _showGameOverDialog();
        }
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _gameLogic.clearInput();
    });
  }

  void _onGiveUpPressed() {
    _showGiveUpDialog();
  }

  void _showVictoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40), // Меньше отступы — больше окно
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Победа!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/star.png',
                      height: 28,
                      width: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Вы угадали число за ${TextUtils.getAttemptsText(_gameLogic.attempts.length)}!',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _gameLogic.resetGame();
                            _remainingAttempts = 10;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Сыграть еще'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Закрыть окно
                          Navigator.pop(context); // В меню
                        },
                        child: const Text('В меню'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  void _showGiveUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Сдаться?'),
          content: const Text(
            'Вы уверены, что хотите сдаться?\n'
            'Вы больше не сможете продолжить игру.',
            style: TextStyle(fontSize: 10, color: Colors.black54),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Закрыть только диалог
                  },
                  child: const Text('Отмена'),
                ),
                const SizedBox(width: 10), // <-- Меньше отступ между кнопками
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Закрываем подтверждение
                    _showGameOverDialog();   // Показываем проигрыш
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Сдаться'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }


  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40), // Больше размер окна
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Поражение',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/bomb.png',
                      height: 35,
                      width: 35,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Правильный ответ: ${_gameLogic.secretNumber}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _gameLogic.resetGame();
                            _remainingAttempts = 10;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Сыграть еще'),
                      ),
                    ),
                    const SizedBox(width: 10), // Меньше отступ между кнопками
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Закрыть диалог
                          Navigator.pop(context); // Вернуться в меню
                        },
                        child: const Text('В меню'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16), // Этот отступ для текста "Осталось попыток"
        child: Column(
          children: [
            // Счётчик попыток (отступ от верхнего края)
            Padding(
              padding: const EdgeInsets.only(bottom: 20), // Отступ от верхнего края
              child: Text(
                'Осталось попыток: $_remainingAttempts',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // История попыток с прокруткой (переместим вниз)
            Expanded(
              child: Scrollbar(
                thumbVisibility: true, // Показывает полосу прокрутки
                child: ListView.builder(
                  reverse: true, // Элементы будут добавляться сверху
                  itemCount: _gameLogic.attempts.length,
                  itemBuilder: (context, index) {
                    return AttemptItem(attempt: _gameLogic.attempts[index]);
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Текущий ввод
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _gameLogic.currentInput.length > index ? _gameLogic.currentInput[index] : '',
                    style: const TextStyle(fontSize: 28),
                  ),
                );
              }),
            ),

            const SizedBox(height: 10),

            // Цифровая клавиатура
            NumberPad(
              onNumberPressed: _onNumberPressed,
              onSubmitPressed: _onSubmitPressed,
              onClearPressed: _onClearPressed,
              isSubmitEnabled: _gameLogic.isSubmitEnabled,
            ),

            const SizedBox(height: 10),

            // Кнопка сдаться
            ElevatedButton(
              onPressed: _onGiveUpPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Сдаться'),
            ),
          ],
        ),
      ),
    );
  }

}