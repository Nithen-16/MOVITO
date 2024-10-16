import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:movito1/category_screen.dart';
import 'package:movito1/products_data/product_list.dart';
import 'package:movito1/profile_screen.dart';
import 'package:movito1/category/Fruits & Vegetables_category.dart';
import 'package:movito1/category/Dairy_category.dart';
import 'package:movito1/category/books & stationery_category.dart';



final List<Map<String, String>> categories = [
  {'name': 'Fruits & Vegetables', 'image': 'assets/t-shirts/athletic_fit.jpeg'},
  {'name': 'Dairy', 'image': 'assets/t-shirts/fit.jpeg'},
  {'name': 'Books & Stationery', 'image': 'assets/t-shirts/long_sleeve.jpeg'},
  {'name': 'Cosmetics', 'image': 'assets/t-shirts/pocket.jpeg'},
];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int _currentPage = 0;
  late CarouselController _carouselController;
  late PageController _pageController;

  final List<String> imagePaths = [
    'assets/t-shirts/athletic_fit.jpeg',
    'assets/t-shirts/crew_neck.jpeg',
    'assets/t-shirts/fit.jpeg',
    'assets/t-shirts/graphic.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    _pageController = PageController(initialPage: _currentPage);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(categoryName: '')));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple[100],
      leading: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Image.asset('assets/logo_m.png', fit: BoxFit.contain),
      ),
      title: _buildSearchField(),
      actions: [_buildCartButton()],
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: 500,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search shirts',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.qr_code_scanner_rounded),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }

  IconButton _buildCartButton() {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        // Handle cart action
      },
    );
  }

  Widget _buildBody() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildCarouselSlider(),
            SizedBox(height: 10),
            _buildPageIndicator(),
            SizedBox(height: 25),
            _buildCategoryHeader(),
            _buildCategoryList(),
            SizedBox(height: 30),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }


  Widget _buildCarouselSlider() {
    return CarouselSlider(
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Image.asset(path, fit: BoxFit.fitHeight),
            );
          },
        );
      }).toList(),
      // carouselController: _carouselController,
      options: CarouselOptions(
        height: 250.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 12 / 9,
        viewportFraction: 0.8,
        onPageChanged: (index, reason) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Center(
      child: SmoothPageIndicator(
        controller: _pageController,
        count: imagePaths.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.purple,
          dotColor: Colors.grey,
          dotHeight: 8.0,
          dotWidth: 8.0,
          expansionFactor: 3,
        ),
        onDotClicked: (index) {
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
      ),
    );
  }

  Widget _buildCategoryHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Shop by Category:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget _buildCategoryList() {
    return SizedBox(
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => _navigateToCategory(category['name']!),
            child: _buildCategoryCard(category),
          );
        },
      ),
    );
  }

  void _navigateToCategory(String categoryName) {
    Widget categoryPage;
    switch (categoryName) {
      case 'Fruits & Vegetables':
        categoryPage = FruitsVegetablecategory(FruitsVegetablecategoryName: categoryName);
        break;
      case 'Dairy':
        categoryPage = DairyCategory(DairyCategoryName: categoryName);
        break;
      case 'Books & Stationery':
        categoryPage = BooksstationeryCategory(BooksstationeryCategoryName: categoryName);
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => categoryPage));
  }

  Widget _buildCategoryCard(Map<String, String> category) {
    return Container(
      width: 120.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.purple[100]!.withOpacity(0.6),
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(category['image']!, width: 90.0, height: 80.0, fit: BoxFit.fill),
          Text(
            category['name']!,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: productDetails.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 50.0,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(productDetails[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      width: 200.0,
      height: 50.0,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(product),
            _buildProductDetails(product),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, String> product) {
    return Stack(
      children: [
        Image.asset(
          product['image']!,
          width: double.infinity,
          height: 90,
          fit: BoxFit.fill,
        ),
        Positioned(
          right: 12,
          bottom: 4,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              "\$${product['price']}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails(Map<String, String> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        children: [
          Text(
            product['itemName']!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    product['itemDescription']!,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add to cart functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: Colors.purple[100],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}