import 'package:flutter/material.dart';
import 'package:seller/components/horizontal_listview.dart';
import 'package:seller/components/products.dart';
import 'package:seller/pages/cart.dart';
//my imports
import 'package:seller/reusable.dart';
// import 'components/horizontal_listview.dart';
// import 'components/products.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seller/pages/login.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    //Image carousel begins here

    Widget image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.easeInCubic,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.greenAccent,
        indicatorBgPadding: 4.0,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Center(child: Text('ART SELLER')),
          backgroundColor: Colors.green[300],
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){
               
              },
            ),
            IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Biswa Aryal'),
                accountEmail: Text('biswa.infolat@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),

              //body
              ReusablePart(
                icon: Icon(Icons.home),
                text: Text('Home Page'),
              ),
              ReusablePart(
                icon: Icon(Icons.person),
                text: Text('My Account'),
              ),
              ReusablePart(
                icon: Icon(Icons.shopping_bag),
                text: Text('My Orders'),
              ),
              ReusablePart(
                icon: Icon(Icons.category),
                text: Text('Categories'),
              ),
              ReusablePart(
                icon: Icon(Icons.favorite),
                text: Text('Favourites'),
              ),

              Divider(),

              ReusablePart(
                icon: Icon(Icons.settings),
                text: Text('Settings'),
              ),
              ReusablePart(
                icon: Icon(Icons.info),
                text: Text('About'),
              ),
              InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),
            ],
          ),
        ),
        body: Column(
          children: [
            image_carousel, // image carousel begings

            //padding widget
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('categories'),
            ),

            //horizontal list view begins here

            HorizontalList(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Recent Items'),
            ),

            Flexible(child: Products()),
          ],
        ));
  }
}



