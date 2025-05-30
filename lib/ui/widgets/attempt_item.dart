import 'package:flutter/material.dart';
import 'package:bulls_and_cows/app/game_logic.dart';

class AttemptItem extends StatelessWidget {
  final AttemptResult attempt;
  final bool isLatest;

  const AttemptItem({
    super.key, 
    required this.attempt,
    this.isLatest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLatest ? Colors.green[50] : null,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          '${attempt.attempt} - ${attempt.bulls}🐂 ${attempt.cows}🐄',
          style: TextStyle(
            fontSize: 18,
            fontWeight: isLatest ? FontWeight.bold : FontWeight.normal,
            color: attempt.isWinner ? Colors.green : Colors.black,
          ),
        ),
        trailing: attempt.isWinner 
            ? const Icon(Icons.star, color: Colors.green)
            : null,
      ),
    );
  }
}