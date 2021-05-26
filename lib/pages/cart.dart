import 'package:flutter/material.dart';
import 'package:seller/components/cart_products.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        elevation: 0.1,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            }),
        ],
      ),

      body: CartProducts(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('TOTAL'),
                subtitle: Text('\$450'),
              ),
            ),
            Expanded(
              child: MaterialButton(
                child: Text('Checkout',style: TextStyle(color: Colors.white, fontSize: 25.0),),
                color: Colors.red,
                onPressed: (){

              }),
             
              ),
          ],
        ),
      ),
    );
  }
}