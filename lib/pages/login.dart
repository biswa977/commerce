import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; //
import 'package:google_sign_in/google_sign_in.dart'; //
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seller/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';
//import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedIn = false;
  bool hidePass = true;
  //List<DocumentSnapshot> documents;

  @override
  void initState() {
    //_auth.userChanges().listen((event) => setState(() => user = event));
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    // User firebaseUser = await firebaseAuth.currentUser.the){
    //   if (firebaseUser != null){
    //     setState(() => isLogedIn = true);
          
       
    //   }
    // });       //checks if user exists
    // preferences = await SharedPreferences.getInstance();
    //isLogedIn = await googleSignIn.isSignedIn();

    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homePage()));
    }
    setState(() {
      loading = false;
    });
  }

//future ya dekhi yo hai
//   Future handleSignIn() async {
//     setState(() {     //exception ayesi yo comment rakheko hatyo exception
//       loading = true;
//     });
// //yei bata ho delete gareko google authentication huhuhuhu
//     //ya samma ho delete gareko
//   } //

  //@override
  @override
  Widget build(BuildContext context) {
    return Scaffold( //
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/back.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              color: Colors.black.withOpacity(0.6),
              width: double.infinity,
              height: double.infinity),
          Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/logo.png',
                width: 280.0,
                height: 240.0,
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 08.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'your email here',
                                labelText: 'email *',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,

                              //validator code arko pani cha bt yo ni use garna milcha

                              ////naya chai textform field ma api flutter site ma cha
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 08.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                                                          title: TextFormField(
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: 'your Password here',
                                  labelText: 'Password *',
                                ),

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'the password cannot be empty';
                                  } else if (value.length < 6) {
                                    return ' at least 6 characters needed';
                                  }
                                  return null;
                                },

                                keyboardType: TextInputType.emailAddress,
                                controller: _passwordTextController,

                                //validator code arko pani cha bt yo ni use garna milcha

                                ////naya chai textform field ma api flutter site ma cha
                              ),
                              trailing: IconButton(onPressed: (){
                                  setState(() {
                                    hidePass = false;
                                  });
                              }, icon: Icon(Icons.remove_red_eye)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 08.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Row(
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              InkWell(
                                onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),//
    );
  }
}
//
