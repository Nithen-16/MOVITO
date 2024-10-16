import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movito1/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Navigate to home screen after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      print("User logged in successfully");
    } catch (e) {
      print(e); // Handle login error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  Future<void> _resetPassword() async {
    if (email.isNotEmpty) {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset email sent!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter your email to reset password."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login")),
      backgroundColor: Colors.deepPurple[100],
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, // Full screen height
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,   // User icon
                      size: 100.0,    // Size of the icon
                      color: Colors.deepPurple[600], // Optional: Change color
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.deepPurple[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[300]),
                      child: Text('Login', style: TextStyle(color: Colors.deepPurple[600]
                          ,fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                    TextButton(
                      onPressed: _resetPassword,
                      child: Text('Forgot Password?'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text('New user? Sign up here'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }
}