import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movito1/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String email = '';
  String password = '';
  String username = '';
  String mobileno = '';
  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Sign up user with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Store additional user information in Firestore
        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'username': username,
          'mobileno': mobileno,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
        print("User signed up successfully");
      } catch (e) {
        print(e); // Handle sign-up error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      //appBar: AppBar(title: Text("Sign Up")),
      body:Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, // Full screen height
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.person,   // User icon
                      size: 100.0,     // Size of the icon
                      color: Colors.deepPurple[600], // Optional: Change color
                    ),
                    Text('SignUp',style: TextStyle(fontSize: 35,color: Colors.deepPurple[600],fontWeight: FontWeight.bold),),


                    TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      keyboardType: TextInputType.text, // Correct the typo
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        username = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Mobile No'),
                      keyboardType: TextInputType.phone, // Correct input type for phone numbers
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a mobile number.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        mobileno = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[300]),
                      child: Text('Sign Up', style: TextStyle(color: Colors.deepPurple[600]
                          ,fontWeight: FontWeight.bold,fontSize: 25),),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Already have an account? Log in here'),
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