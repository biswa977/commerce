import 'package:flutter/material.dart';
import 'package:seller/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var product_list = [
    {
      "name" : "blazer",
      "picture" : "images/products/blazer1.jpeg",
      "old_price" : 120,
      "price" : 100,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/blazer2.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/dress1.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/dress2.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/hills1.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/hills2.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/pants1.jpg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/pants2.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/shoe1.jpg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/skt1.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    {
      "name" : "Red dress",
      "picture" : "images/products/skt2.jpeg",
      "old_price" : 200,
      "price" : 80,
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
       itemBuilder: (BuildContext context, int index){
         return Padding(
           padding: const EdgeInsets.all(2.0),
           child: Single_prod(
             prod_name: product_list[index]['name'],
             prod_picture: product_list[index]['picture'],
             prod_old_price: product_list[index]['old_price'],
             prod_price: product_list[index]['price'],
           ),
         );
       },
    );
  }
}
class Single_prod extends StatelessWidget {
  
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  
  Single_prod({
    this.prod_name,
    this.prod_old_price,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text('i am hero'), 
        child: Material(
          child: InkWell(

            onTap: ()=> Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetails(
                //passing values to another product details class through navigation code
                product_detail_name: prod_name,
                product_detail_new_price: prod_price,
                product_detail_old_price: prod_old_price,
                product_detail_picture: prod_picture,
              ),),
            ), //navigation code

            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  title: Text('\$$prod_price', style: TextStyle(color: Colors.green[700]),
                  ),
                  subtitle: Text(
                    '\$$prod_old_price',
                     style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w800,
                       decoration: TextDecoration.lineThrough,
                       ),
                  ),
                ),
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover
              ),
              ),
          )
        ))
    );
  }
}