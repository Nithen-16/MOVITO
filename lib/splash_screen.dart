import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  Animation<double>? _scaleAnimation;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and set the duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Animation duration
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut, // Use an easing curve for smooth scaling
      ),
    );

    // Define the rotation animation (rotates 360 degrees, 2 * pi radians)
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller!.forward();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {}); // Splash screen delay
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
  }

  @override
  void dispose() {
    _controller!.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation!,
              child: ScaleTransition(
                scale: _scaleAnimation!,
                child: RotationTransition(
                  turns: _rotationAnimation!,
                  child: Image.asset('assets/m.png',
                    width: 500,
                    height: 500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Positioned(
              //   top: -70,
              //   left: -70,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(90.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/t-shirts/henley.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
              // ),
              //
              // Positioned(
              //   top: 200,
              //   left: -110,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(120.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/buffallo check.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
              // ),
              //
              // Positioned(
              //   top: -70,
              //   right: -70,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(90.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/t-shirts/athletic fit.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
              // ),
              //
              // Positioned(
              //   top: 450,
              //   right: -110,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(90.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/t-shirts/pocket.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
              // ),
              //
              // // Bottom left image
              // Positioned(
              //   bottom: -70,
              //   left: -70,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(90.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/t-shirts/sleevelesss.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
              // ),
              // // Bottom right image
              // Positioned(
              //   bottom: -70,
              //   right: -70,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(90.0), // Circular border radius
              //     child: Image.asset(
              //       'assets/t-shirts/oversize fit.jpeg',
              //       width: 200,  // Increased width
              //       height: 200, // Increased height
              //       fit: BoxFit.cover, // Ensures the image covers the space
              //     ),
              //   ),
