import 'package:flutter/material.dart';
import 'package:movito1/products_data/Dairy_products.dart';




class DairyCategory extends StatefulWidget {
  final String DairyCategoryName;


  // Constructor to initialize BestSellingcategoryName
  const DairyCategory({Key? key, required this.DairyCategoryName}) : super(key: key);


  @override
  State<DairyCategory> createState() => _DairyCategoryState();
}


class _DairyCategoryState extends State<DairyCategory> {








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text('Diary')
              // Text(widget.MuttoncategoryName), // Access categoryName here
              // SizedBox(width: 100),
              // Icon(Icons.search),
              // SizedBox(width: 10),
              // Icon(Icons.favorite),
              // SizedBox(width: 10),
              // Icon(Icons.shopping_cart),
            ],
          ),
        ),




        body: Container(
          child :Scrollbar(
            thumbVisibility: true,
            child: GridView.builder(
              itemCount: dairyDetails.length,
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
                            dairyDetails[index]['image']!,
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
                                "\$${dairyDetails[index]['price']}",
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
                          "${dairyDetails[index]['itemName']}",
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
                                "${dairyDetails[index]['itemDescription']}",
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
        )
    );
  }
}


