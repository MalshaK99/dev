import 'package:flutter/material.dart';
import 'package:hungry_busters/footer.dart';
import 'package:hungry_busters/heartButton.dart';

import 'menu.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.red,
          ),
          actions: <Widget>[
            const Text('Good Afternoon Victoria!'),
            Image.asset('assets/avatar.png'),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search meals',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                focusNode: _searchFocusNode,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/cover.png',
                fit: BoxFit.cover,
                width: 200.0,
              ),
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.red,
                      child: Image.asset(
                        'assets/dinner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  item.imageUrl,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width / 3,
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                right: 8.0,
                                child: HeartButton(),
                              ),
                              Positioned(
                                bottom: 8.0,
                                right: 8.0,
                                child: Text(
                                  '${item.price} LKR',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                left: MediaQuery.of(context).size.width / 3 +
                                    16.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.red, size: 20.0),
                                        Icon(Icons.star,
                                            color: Colors.red, size: 20.0),
                                        Icon(Icons.star,
                                            color: Colors.red, size: 20.0),
                                        Icon(Icons.star,
                                            color: Colors.red, size: 20.0),
                                        Icon(Icons.star_border,
                                            color: Colors.grey, size: 20.0),
                                        Text(
                                          '4.5',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      item.subtitle,
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }).toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Footer(
          currentPage: 'home',
          onPageChanged: (String) {},
        ),
      ),
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double price;

  Item({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

final List<Item> items = [
  Item(
    imageUrl: 'assets/food1.png',
    title: 'Tex Mex BBQ',
    subtitle: 'non veg classic meat',
    price: 1050.0,
  ),
  Item(
    imageUrl: 'assets/food2.png',
    title: 'Pasta Mozarella',
    subtitle: 'cheasy classic dish',
    price: 2000.0,
  ),
  Item(
    imageUrl: 'assets/food1.png',
    title: 'Burger BBQ',
    subtitle: 'non veg classic burgur',
    price: 1200.0,
  ),
  Item(
    imageUrl: 'assets/food2.png',
    title: 'Pasta Mozarella',
    subtitle: 'non veg classic meat',
    price: 2100.0,
  ),
  Item(
    imageUrl: 'assets/food1.png',
    title: 'Burger BBQ',
    subtitle: 'non veg classic meat',
    price: 1200.0,
  ),
  Item(
    imageUrl: 'assets/food2.png',
    title: 'Pasta Mozarella',
    subtitle: 'non veg classic dish',
    price: 1500.0,
  ),
];
