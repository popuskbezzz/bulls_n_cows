import 'dart:math';
import 'package:flutter/foundation.dart';

class GameLogic {
  String _secretNumber = '';
  String _currentInput = '';
  final List<AttemptResult> _attempts = [];
  final Random _random = Random();

  String get currentInput => _currentInput;
  List<AttemptResult> get attempts => _attempts;
  bool get isSubmitEnabled => _currentInput.length == 4;
  String get secretNumber => _secretNumber;

  GameLogic() {
    _generateSecretNumber();
  }

  void _generateSecretNumber() {
    final digits = List.generate(10, (i) => i)..shuffle(_random);
    _secretNumber = digits.take(4).join();
    if (kDebugMode) {
      debugPrint('Загаданное число: $_secretNumber');
    }
  }

  void addDigit(String digit) {
    if (_currentInput.length < 4 && !_currentInput.contains(digit)) {
      _currentInput += digit;
    }
  }

  void clearInput() {
    _currentInput = '';
  }

  void submitAttempt() {
    if (_currentInput.length == 4) {
      final result = _checkAttempt(_currentInput);
      _addAttempt(result); // Используем новый метод
      _currentInput = '';
    }
  }

  void _addAttempt(AttemptResult attempt) {
    _attempts.insert(0, attempt); // Вставляем новую попытку в начало списка
  }

  AttemptResult _checkAttempt(String attempt) {
    int bulls = 0;
    int cows = 0;
    
    for (int i = 0; i < 4; i++) {
      if (attempt[i] == _secretNumber[i]) {
        bulls++;
      } else if (_secretNumber.contains(attempt[i])) {
        cows++;
      }
    }
    
    return AttemptResult(
      attempt, 
      bulls, 
      cows,
      isWinner: bulls == 4,
    );
  }

  void resetGame() {
    _currentInput = '';
    _attempts.clear();
    _generateSecretNumber();
  }
}

class AttemptResult {
  final String attempt;
  final int bulls;
  final int cows;
  final bool isWinner;

  AttemptResult(this.attempt, this.bulls, this.cows, {this.isWinner = false});
}

class TextUtils {
  // Метод для правильного склонения слова "попытка"
  static String getAttemptsText(int attempts) {
    if (attempts % 10 == 1 && attempts % 100 != 11) {
      return '$attempts попытку';
    } else if ((attempts % 10 == 2 || attempts % 10 == 3 || attempts % 10 == 4) &&
        (attempts % 100 != 12 && attempts % 100 != 13 && attempts % 100 != 14)) {
      return '$attempts попытки';
    } else {
      return '$attempts попыток';
    }
  }
}