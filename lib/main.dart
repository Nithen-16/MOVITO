import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movito1/login_screen.dart';
import 'package:movito1/splash_screen.dart';
import 'package:movito1/signup_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization for web and mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyADsMi8vwzn6mQauj8aN34Ox2q49YkuFmQ",
        appId: "1:412160664645:android:9ae7506ef80cbe39b9af2c",
      messagingSenderId: "412160664645",
        projectId: "movito1-b175e",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movito1',
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },

    );

  }
}