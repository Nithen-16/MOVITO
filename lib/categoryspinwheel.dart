import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';
import 'dart:async'; // Import StreamController

class CategorySpinWheel extends StatefulWidget {
  @override
  _CategorySpinWheelState createState() => _CategorySpinWheelState();
}

class _CategorySpinWheelState extends State<CategorySpinWheel> {
  final List<String> categories = [
    'Fruits & Vegetables',
    'Dairy',
    'Books & Stationery',
    'Cosmetics',
  ];

  late StreamController<int> selectedController;

  @override
  void initState() {
    super.initState();
    selectedController = StreamController<int>();
  }

  @override
  void dispose() {
    selectedController.close(); // Close the stream when the widget is disposed
    super.dispose();
  }

  void spinWheel() {
    setState(() {
      int randomIndex = Random().nextInt(categories.length);
      selectedController.add(randomIndex); // Add the random index to the stream
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories Spin Wheel"),
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selectedController.stream, // Use the stream from the controller
                items: [
                  for (var category in categories)
                    FortuneItem(
                      child: Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
                      style: FortuneItemStyle(
                        color: Colors.primaries[categories.indexOf(category) % Colors.primaries.length],
                        borderColor: Colors.white,
                      ),
                    ),
                ],
                onAnimationEnd: () {
                  final selectedCategory = categories[Fortune.randomInt(0, categories.length)];
                  print("Selected Category: $selectedCategory");
                  // Navigate to selected category or show dialog
                },
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: spinWheel,
              child: Text("Spin"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300], // Replace primary with backgroundColor

                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
