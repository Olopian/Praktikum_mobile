import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    return [
      Product("Pixel", "Pixel smartphone buatan Google", 800, "pixel.png"),
      Product("Laptop", "Laptop untuk pekerjaan", 2000, "laptop.png"),
      Product("Tablet", "Tablet is the most useful device ever for meeting", 1500, "tablet.png"),
      Product("Pendrive", "iPhone is the stylish phone ever", 100, "pendrive.png"),
      Product("Floppy Drive", "iPhone is the stylish phone ever", 20, "floppy.png"),
      Product("iPhone", "iPhone is the stylish phone ever", 1000, "iphone.png"),
      Product("iPhone XR", "iPhone XR is the stylish phone ever", 1000, "iphone_XR.png"),
    ];
  }
}

class MyRatingPage extends StatelessWidget {
  MyRatingPage({Key? key, this.title}) : super(key: key);
  
  final String? title;
  final List<Product> items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('assets/' + this.item.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(this.item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(this.item.description),
              Text("Price: \$${this.item.price.toString()}"),
              RatingBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 30.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          IconButton(
            icon: Icon(
              i <= _rating ? Icons.star : Icons.star_border,
              size: _size,
            ),
            color: i <= 3 ? Colors.amber : Colors.grey,
            onPressed: () => _setRating(i),
          ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);
  
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              color: Colors.blue[400],
              child: Center(
                child: Image.asset('assets/' + this.item.image),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price: \$${this.item.price.toString()}"),
                    RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
