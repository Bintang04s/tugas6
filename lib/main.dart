import 'package:flutter/material.dart';
import 'Product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product Layout Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final List<Product> items = Product.getProducts();

  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  final Product item;

  ProductPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/appimages/${item.image}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Price: \$${item.price}"),
            ),
            RatingBox(),
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final Product item;

  ProductBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/appimages/${item.image}"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(item.description),
                    Text("Price: \$${item.price}"),
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

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRating(int value) {
    setState(() {
      _rating = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int i = 1; i <= 3; i++)
          IconButton(
            icon: Icon(
              _rating >= i ? Icons.star : Icons.star_border,
              size: _size,
            ),
            color: Colors.red[500],
            onPressed: () => _setRating(i),
          ),
      ],
    );
  }
}
