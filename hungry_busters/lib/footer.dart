import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(),
        bottomNavigationBar: Footer(), // Using the Footer widget here
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 253, 251, 251),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButtonWithColorChange(
            icon: Icon(Icons.home),
            onPressed: () {
              // Add functionality for home button
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Add functionality for location button
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              // Add functionality for bag button
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Add functionality for heart button
            },
          ),
        ],
      ),
    );
  }
}

class IconButtonWithColorChange extends StatefulWidget {
  final Icon icon;
  final Function()? onPressed;

  IconButtonWithColorChange({
    required this.icon,
    required this.onPressed,
  });

  @override
  _IconButtonWithColorChangeState createState() =>
      _IconButtonWithColorChangeState();
}

class _IconButtonWithColorChangeState extends State<IconButtonWithColorChange> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        widget.onPressed?.call();
      },
      icon: Icon(
        widget.icon.icon,
        size: 30, // Adjust icon size as needed
        color:
            _isPressed ? Colors.red : const Color.fromARGB(255, 115, 114, 114),
      ),
    );
  }
}
