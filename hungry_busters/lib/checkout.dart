import 'package:flutter/material.dart';
import 'package:hungry_busters/footer.dart';
import 'package:hungry_busters/popup.dart';

void main() => runApp(CheckOut());

class CheckOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Order Summary', // Heading text
                style: TextStyle(
                  fontSize: 25, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
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
            SizedBox(height: 10), // Add spacing between cards and dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dot(color: Colors.grey), // Grey dot
                SizedBox(width: 10), // Add spacing between dots
                Dot(color: Colors.grey), // Grey dot
                SizedBox(width: 10), // Add spacing between dots
                Dot(color: Colors.red), // Red dot
              ],
            ),
            SizedBox(height: 10), // Add spacing between dots and button
            // Check Out button
            Padding(
              padding: const EdgeInsets.all(8.0), // Adjust padding as needed
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PopUp();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 16), // Adjust button height
                    backgroundColor: Colors.red, // Set background color to red
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 20), // Add padding between button and bottom
          ],
        ),
        bottomNavigationBar: Footer(
          currentPage: 'checkout',
          onPageChanged: (String) {},
        ), // Include Footer widget here
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;

  const Dot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10, // Adjust the size of the dot
      height: 10, // Adjust the size of the dot
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              item.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
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
                      Icon(Icons.star, color: Colors.red, size: 20.0),
                      Icon(Icons.star, color: Colors.red, size: 20.0),
                      Icon(Icons.star, color: Colors.red, size: 20.0),
                      Icon(Icons.star, color: Colors.red, size: 20.0),
                      Icon(Icons.star_border, color: Colors.grey, size: 20.0),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${item.price} LKR',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(), // Add spacer to push buttons to the right
                      IncDecCounter(),
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

class IncDecCounter extends StatefulWidget {
  @override
  _IncDecCounterState createState() => _IncDecCounterState();
}

class _IncDecCounterState extends State<IncDecCounter> {
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
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrement,
          color: Colors.red,
        ),
        Text('$quantity'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increment,
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
