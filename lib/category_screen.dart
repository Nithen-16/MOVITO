import 'package:flutter/material.dart';
import 'package:movito1/products_data/product_list.dart';
import 'package:movito1/home_screen.dart';
import 'package:movito1/profile_screen.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override

  int _selectedIndex = 1;
  int _currentPage = 0;
  late PageController _pageController; // Define the PageController

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage); // Initialize the controller
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()), // Your home page
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryPage(categoryName: '')), // Category page
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()), // Category page
          );
          break;
      // Add other cases for additional pages
      }

    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(widget.categoryName), // Access categoryName here
            SizedBox(width: 100),
            Icon(Icons.search),
            SizedBox(width: 10),
            Icon(Icons.favorite),
            SizedBox(width: 10),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: Container(
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productDetails.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 50.0,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 200.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0x1F000000)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE1BEE7),
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image and Price
                  Stack(
                    children: [
                      Image.asset(
                        productDetails[index]['image']!,
                        width: double.infinity,
                        height: 110,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        right: 12,
                        bottom: 4,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            "\$${productDetails[index]['price']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "${productDetails[index]['itemName']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${productDetails[index]['itemDescription']}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.purple[100],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),

    );
  }
}