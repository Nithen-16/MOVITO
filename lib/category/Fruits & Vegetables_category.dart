import 'package:flutter/material.dart';
import 'package:movito1/products_data/Fruits%20&%20Vegetables_products.dart';
import 'package:movito1/products_data/product_list.dart';




class FruitsVegetablecategory extends StatefulWidget {
  final String FruitsVegetablecategoryName;


  // Constructor to initialize BestSellingcategoryName
  const FruitsVegetablecategory({Key? key, required this.FruitsVegetablecategoryName}) : super(key: key);


  @override
  State<FruitsVegetablecategory> createState() => _FruitsVegetablecategoryState();
}


class _FruitsVegetablecategoryState extends State<FruitsVegetablecategory> {








  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text('Fruits & Vegetables'),
              Text(widget.FruitsVegetablecategoryName), // Access categoryName here
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
          child:Scrollbar(
            thumbVisibility: true,
            child: GridView.builder(
              itemCount: fruitsvegDetails.length,
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
                            fruitsvegDetails[index]['image']!,
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
                                "\$${fruitsvegDetails[index]['price']}",
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
                          "${fruitsvegDetails[index]['itemName']}",
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
                                "${fruitsvegDetails[index]['itemDescription']}",
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
