import 'package:flutter/material.dart';
import 'package:seller/main.dart';
import 'package:seller/pages/home.dart';

class ProductDetails extends StatefulWidget {

  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

ProductDetails({
  this.product_detail_name,   //navigator bata products bata pathako value haru ya ayera baseko awastha
  this.product_detail_new_price,
  this.product_detail_old_price,
  this.product_detail_picture
});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homePage()),
  );
            },
            child: Text('ART SELLER')),
          ),
        backgroundColor: Colors.green[300],
        actions: [
          IconButton(
            icon: Icon(Icons.search),color: Colors.white,
             onPressed: null,
             ),
        ],
        ),

        body: ListView(
          children: [
            Container(
              height: 300.0,
              child:GridTile(
                  child: Container(
                    height: 300.0,
                    color: Colors.white,
                    child: Image.asset(widget.product_detail_picture),  //prod detail picture chai base class ko huna le yesma taaneko
                  ), 
                  footer: Container(                            //widget vanne vitra vako huna le widget. gareko ho
                    color: Colors.white,
                    child: ListTile(
                        leading: Text(widget.product_detail_name,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),   //prod detail picture chai base class ko huna le yesma taaneko
                        title: Row(                                 //leading left ma huncha title bich ma tei ho farak
                                children: [
                                  Expanded(child: Text('\$${widget.product_detail_old_price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, decoration: TextDecoration.lineThrough),
                                  
                                  ),),

                                  Expanded(child: Text('\$${widget.product_detail_new_price}',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.green[300]),),),
                                ],
                        ),
                    ),
                  ),
              ),
            ),
            Row(
              children: [

                  //size button

                Expanded(
                 child: MaterialButton(
                   onPressed: (){
                      showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('hello'),
                          content: Text('choose the size'),
                          actions: [
                            MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text('close')),
                          
                          ],
                        );
                      });
                   },
                   color: Colors.white60,
                   textColor: Colors.green[800],
                   elevation: 0.2,
                   child: Row(
                     children: [
                       Expanded(child: Text('Size')),
                       Expanded(child: Icon(Icons.arrow_drop_down_sharp, size: 30.0,)),
                     ],),
                   ),
                ),
                Expanded(
                 child: MaterialButton(
                   onPressed: (){
                     showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('hello'),
                          content: Text('choose the color'),
                          actions: [
                            MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text('close')),
                          
                          ],
                        );
                      });

                   },
                   color: Colors.white60,
                   textColor: Colors.green[800],
                   elevation: 0.2,
                   child: Row(
                     children: [
                       Expanded(child: Text('Colors')),
                       Expanded(child: Icon(Icons.arrow_drop_down_sharp, size: 30.0,)),
                     ],),
                   ),
                ),
                Expanded(
                 child: MaterialButton(
                   onPressed: (){
                     showDialog(context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('hello'),
                          content: Text('choose quantity'),
                          actions: [
                            MaterialButton(onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text('close')),
                          
                          ],
                        );
                      });

                   },
                   color: Colors.white60,
                   textColor: Colors.green[800],
                   elevation: 0.2,
                   child: Row(
                     children: [
                       Expanded(child: Text('Qty')),
                       Expanded(child: Icon(Icons.arrow_drop_down_sharp, size: 30.0,)),
                     ],),
                   ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                    },
                    color: Colors.green[800],
                    textColor: Colors.white,
                    child: Text('Buy Now'),
                  ),
                ),
                IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.green[800],), onPressed: (){}), 
                IconButton(icon: Icon(Icons.favorite_border, color: Colors.green[800],), onPressed: (){}),
              ],
            ),
            Divider(),
            ListTile(
                title: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
            ),
            Divider(),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text('Product Name :', style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold), ),),
                Padding(padding: EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name, style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold),),),
              ]
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text('Product Brand :', style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold), ),),
                Padding(padding: EdgeInsets.all(5.0),
                child: Text('ORIGINAL BRAND', style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold),),),
              ]
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text('Product Condition :', style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold), ),),
                Padding(padding: EdgeInsets.all(5.0),
                child: Text('BRAND NEW', style: TextStyle(color:Colors.green[800], fontWeight: FontWeight.bold),),
                ),

                
              ]
            ),
            
                // SSIMILAR PRODUCTS
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Similar Products'),
                ),
            Container(
                  height:340.0,
                  child: Similar_products(),
                )
          ],
        ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
 
 
  var product_list = [
    
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
         return Similar_Single_prod(
           prod_name: product_list[index]['name'],
           prod_picture: product_list[index]['picture'],
           prod_old_price: product_list[index]['old_price'],
           prod_price: product_list[index]['price'],
         );
       },
    );
  }
}
class Similar_Single_prod extends StatelessWidget {
  
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  
  Similar_Single_prod({
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