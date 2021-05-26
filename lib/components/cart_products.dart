import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_the_cart = [
    {
      "name": "blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 100,
      'size': 'M',
      'color': 'red',
      'quantity': '1',
    },
    {
      "name": "shoes",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      'size': 'M',
      'color': 'black',
      'quantity': '1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: products_on_the_cart[index]['name'],
            cart_prod_color: products_on_the_cart[index]['color'],
            cart_prod_quantity: products_on_the_cart[index]['quantity'],
            cart_prod_size: products_on_the_cart[index]['size'],
            cart_prod_price: products_on_the_cart[index]['price'],
            cart_prod_picture: products_on_the_cart[index]['picture'],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_size;
  final cart_prod_price;
  final cart_prod_quantity;
  final cart_prod_color;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_color,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_quantity,
    this.cart_prod_size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        
        //leading for image
        leading: Image.asset(
          cart_prod_picture,
          width: 80.0,
          height: 80.0,
        ),

        //title for tile

        title: Text(cart_prod_name),

        //subtitle for tile

        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text('size:'),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                //this section is for color

                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('color'),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                //this section is for price of the product
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$${cart_prod_price}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        // trailing: Column(
        //   children: [
        //     IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},),
        //     Text('$cart_prod_quantity'),
        //     IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},),
        //   ],
        // ),
      ),
    );
  }
}
