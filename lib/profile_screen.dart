import 'package:flutter/material.dart';
import 'package:movito1/home_screen.dart';
import 'package:movito1/category_screen.dart';

class ProfilePage  extends StatefulWidget {
  const ProfilePage ({super.key});

  @override
  State<ProfilePage > createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override



  int _selectedIndex = 2;
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
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0, // Hidden toolbar to match the image
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Hi, Guest",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(text: "Please "),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " to enjoy your shopping"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Divider(),
            _buildListItem(
              context,
              icon: Icons.card_giftcard,
              title: 'Earn Rewards',
              subtitle: 'Invite friends and earn rewards',
            ),
            _buildListItem(
              context,
              icon: Icons.phone,
              title: 'Contact Us',
              subtitle: 'Help regarding your recent purchase',
            ),
            _buildListItem(
              context,
              icon: Icons.help_outline,
              title: 'FAQs',
              subtitle: 'Frequently Asked Questions',
            ),
            Divider(),
            _buildListItem(
              context,
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
            ),
            _buildListItem(
              context,
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
            ),
            _buildListItem(
              context,
              icon: Icons.storefront_outlined,
              title: 'Seller Information',
            ),
            Divider(),
            _buildListItem(
              context,
              icon: Icons.logout,
              title: 'LogOut',
            ),
          ],
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

  // A method to build each list item
  Widget _buildListItem(BuildContext context,
      {required IconData icon, required String title, String? subtitle}) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
        // Implement navigation or actions
      },
    );
  }
}