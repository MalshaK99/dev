import 'package:flutter/material.dart';
import 'package:hungry_busters/checkout.dart';
import 'package:hungry_busters/home.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16), // Added padding here
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 253, 251, 251),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5), // Border color
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButtonWithColorChange(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOut()),
              );
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOut()),
              );
            },
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
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
    required this.onPressed, // Removed the extra comma here
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
        color: _isPressed ? Colors.red : Color.fromARGB(255, 136, 136, 136),
      ),
    );
  }
}
