import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.red, // Set menu icon color to red
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
                decoration: InputDecoration(
                  hintText: 'Search meals',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor:
                      Colors.grey[200], // Set ash color fill for search bar
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/cover.png',
                fit: BoxFit.cover,
                width: 200.0, // Set width to make it align left
              ),
            ),
            Container(
              height: 100.0, // Adjust the height of the repeating list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Change the number of repeating items as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30.0, // Set the radius of the circle
                      backgroundColor:
                          Colors.red, // Set the background color to red
                      child: Image.asset(
                        'assets/dinner.png', // Change to your image asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Set card border radius
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.zero, // Remove the default padding
                      leading: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: double
                            .infinity, // Set the height to fill the ListTile
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              16.0), // Match card border radius
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    0.0), // Adjust the vertical padding here
                            child: Image.asset(
                              items[index].imageUrl,
                              fit: BoxFit
                                  .cover, // Cover the container with the image
                            ),
                          ),
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${items[index].price} LKR',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].subtitle,
                            style: TextStyle(fontSize: 12.0),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.red, size: 20.0),
                              Icon(Icons.star, color: Colors.red, size: 20.0),
                              Icon(Icons.star, color: Colors.red, size: 20.0),
                              Icon(Icons.star, color: Colors.red, size: 20.0),
                              Icon(Icons.star_border,
                                  color: Colors.grey, size: 20.0),
                              Text(
                                '4.5',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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

// Dummy list of items
final List<Item> items = [
  Item(
    imageUrl: 'assets/food1.png',
    title: 'Item 1',
    subtitle: 'Subtitle 1',
    price: 100.0,
  ),
  Item(
    imageUrl: 'assets/food2.png',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    price: 200.0,
  ),
  Item(
    imageUrl: 'assets/food6.png',
    title: 'Item 3',
    subtitle: 'Subtitle 3',
    price: 300.0,
  ),
  Item(
    imageUrl: 'assets/food4.png',
    title: 'Item 3',
    subtitle: 'Subtitle 3',
    price: 300.0,
  ),
  Item(
    imageUrl: 'assets/food5.png',
    title: 'Item 3',
    subtitle: 'Subtitle 3',
    price: 300.0,
  ),
  Item(
    imageUrl: 'assets/food6.png',
    title: 'Item 3',
    subtitle: 'Subtitle 3',
    price: 300.0,
  ),
];
