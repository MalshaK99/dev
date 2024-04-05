import 'package:flutter/material.dart';
import 'package:hungry_busters/checkout.dart';
import 'package:hungry_busters/footer.dart';
import 'package:hungry_busters/heartButton.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/menu.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pasta Mozeralla',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 24.0,
                          ),
                        ),
                        Text(
                          'Cheesy Classic Dish',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Row(
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
                  Column(
                    children: [
                      HeartButton(),
                      SizedBox(width: 8.0),
                      Text(
                        'Price LKR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckOut()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        'Add to Bag',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "TimesNewRoman",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "\nPasta Mozzarella ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              "is a unique blend of cheesy goodness and fluffy flaky pasta richness.is served with your choice of protein or vegetable and any topping of the selected classic and spicy ranges. ",
                        ),
                        TextSpan(
                          text: "\n\nPortion serves two*\n",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 13),
                  Text(
                    "You might also like",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildMenuItem('assets/food6.png'),
                        buildMenuItem('assets/food4.png'),
                        buildMenuItem('assets/food5.png'),
                        buildMenuItem('assets/food6.png'),
                        buildMenuItem('assets/food6.png'),
                        buildMenuItem('assets/food4.png'),
                        buildMenuItem('assets/food5.png'),
                        buildMenuItem('assets/food6.png'),
                        // Add more items if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(), // Include Footer widget here
    );
  }

  Widget buildMenuItem(String imagePath) {
    return GestureDetector(
      onTap: () {
        // Handle button press for each item
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
