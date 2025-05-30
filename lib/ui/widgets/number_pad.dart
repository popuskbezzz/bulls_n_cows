import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onSubmitPressed;
  final VoidCallback onClearPressed;
  final bool isSubmitEnabled;

  const NumberPad({
    super.key,
    required this.onNumberPressed,
    required this.onSubmitPressed,
    required this.onClearPressed,
    required this.isSubmitEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final List<List<String>> keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['delete', '0', 'submit'],
    ];

    return Column(
      children: keys.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((key) => _buildKey(key)).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String key) {
    IconData? icon;
    VoidCallback? onTap;
    Color color = Colors.blue;

    if (key == 'delete') {
      icon = Icons.backspace;
      onTap = onClearPressed;
      color = Colors.red;
    } else if (key == 'submit') {
      icon = Icons.check;
      onTap = isSubmitEnabled ? onSubmitPressed : null;
      color = isSubmitEnabled ? Colors.green : Colors.grey;
    } else {
      onTap = () => onNumberPressed(key);
    }

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          child: icon != null
              ? Icon(icon, color: Colors.white)
              : Text(
                  key,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
