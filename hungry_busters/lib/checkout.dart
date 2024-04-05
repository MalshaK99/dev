import 'package:flutter/material.dart';
import 'package:hungry_busters/footer.dart';

void main() => runApp(CheckOut());

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ItemCard(item: item),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30), // Add spacing before the button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Check Out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Footer(), // Include Footer widget here
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int quantity = 0;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  widget.item.imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.item.price} LKR',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(), // Add spacer to push buttons to the right
                      IncDecCounter(
                        increment: _increment,
                        decrement: _decrement,
                        quantity: quantity,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IncDecCounter extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final int quantity;

  const IncDecCounter({
    Key? key,
    required this.increment,
    required this.decrement,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrement,
          color: Colors.red,
        ),
        Text('$quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: increment,
          color: Colors.red,
        ),
      ],
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String price;

  Item({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

// List of items
final List<Item> items = [
  Item(imageUrl: 'assets/food1.png', title: 'Tex Mex BBQ', price: '1200'),
  Item(imageUrl: 'assets/food2.png', title: 'Pasta Mozarella', price: '1200'),
  Item(imageUrl: 'assets/food1.png', title: 'Burger BBQ', price: '1200'),
  Item(imageUrl: 'assets/food2.png', title: 'Pasta Mozarella', price: '1200'),
];
