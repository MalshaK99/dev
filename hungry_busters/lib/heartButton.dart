import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPressed ? Icons.favorite : Icons.favorite_border,
        color: _isPressed ? Colors.yellow : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
    );
  }
}
