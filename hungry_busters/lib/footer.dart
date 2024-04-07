import 'package:flutter/material.dart';
import 'package:hungry_busters/checkout.dart';
import 'package:hungry_busters/home.dart';
import 'package:hungry_busters/menu.dart';
import 'package:hungry_busters/popup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Home Page')),
      bottomNavigationBar: Footer(
        currentPage: 'home',
        onPageChanged: (String newPage) {
          print('Navigating to $newPage');
        },
      ),
    );
  }
}

class CheckOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('CheckOut Page')),
      bottomNavigationBar: Footer(
        currentPage: 'checkout',
        onPageChanged: (String newPage) {
          print('Navigating to $newPage');
        },
      ),
    );
  }
}

class Footer extends StatelessWidget {
  final String currentPage;
  final Function(String) onPageChanged;

  Footer({required this.currentPage, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 253, 251, 251),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.5),
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
                MaterialPageRoute(builder: (context) => Home()),
              );
              onPageChanged('home');
            },
            isSelected: currentPage == 'home',
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PopUp()),
              );
              onPageChanged('popup');
            },
            isSelected: currentPage == 'popup',
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOut()),
              );
              onPageChanged('checkout');
            },
            isSelected: currentPage == 'checkout',
          ),
          IconButtonWithColorChange(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
              onPageChanged('menu');
            },
            isSelected: currentPage == 'menu',
          ),
        ],
      ),
    );
  }
}

class IconButtonWithColorChange extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  final bool isSelected;

  IconButtonWithColorChange({
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon.icon,
        size: 30,
        color: isSelected ? Colors.red : Color.fromARGB(255, 136, 136, 136),
      ),
    );
  }
}
