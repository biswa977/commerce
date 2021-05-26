import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller/db/users.dart';
import 'package:seller/pages/home.dart';
import 'dart:async';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  String gender;
  String groupValue = 'male';
  bool hidePass = true;

  bool loading = false;

//pixel overfloaded vanne error hatauna cha hai . scaffold ko resize property ramro chaina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //
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
                  child: ListView(
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
                                icon: Icon(Icons.person),
                                hintText: 'Full Name',
                                labelText: 'your full name *',
                                border: InputBorder.none,
                              ),

                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'the Namefield cannot be empty';
                                }
                                return null;
                              },

                              keyboardType: TextInputType.emailAddress,
                              controller: _nameTextController,

                              //validator code arko pani cha bt yo ni use garna milcha

                              ////naya chai textform field ma api flutter site ma cha
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 08.0, 14.0, 8.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ListTile(
                                      title: Text(
                                        'Male',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: 'male',
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e)))),
                              Expanded(
                                  child: ListTile(
                                      title: Text(
                                        'female',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: Radio(
                                          value: 'female',
                                          groupValue: groupValue,
                                          onChanged: (e) => valueChanged(e)))),
                            ],
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
                            child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'your email here',
                                labelText: 'email *',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,

                              //validator code arko pani cha bt yo ni use garna milcha

                              ////naya chai textform field ma api flutter site ma cha
                              validator: (value){
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex =  RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                                return null;
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
                                  border: InputBorder.none,
                                ),

                                validator: (value) {
                                  print('one');                       //test
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
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
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
                                  hintText: 'Confirm Password',
                                  labelText: 'Confirm Password',
                                  border: InputBorder.none,
                                ),

                                validator: (value) {
                                  print('two');               //test two
                                  if (value.isEmpty) {
                                    return 'the password cannot be empty';
                                  } else if (value.length < 6) {
                                    return ' at least 6 characters needed';
                                  } else if (_passwordTextController.text !=
                                      value) {
                                    return ' passwords donot match';
                                  }
                                  return null;
                                },

                                keyboardType: TextInputType.emailAddress,
                                controller: _confirmPasswordController,

                                //validator code arko pani cha bt yo ni use garna milcha

                                ////naya chai textform field ma api flutter site ma cha
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    hidePass = false;
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
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
                            onPressed: () async{
                              print('three');      //test three
                              validateForm();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              'Sign Up',
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
                              SizedBox(
                                width: 5.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Log In',
                                  textAlign: TextAlign.center,
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
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }

   validateForm() async {
   print('four');                     //test four
    FormState formState =  _formKey.currentState;

    if (formState.validate()) {
      

      formState.reset();
      User firebaseUser =  firebaseAuth.currentUser; //paile dekhi nai usercha ki nai vanera firebase ma check garcah
      if (firebaseUser == null) {
          print('five');  //test five
          await firebaseAuth.createUserWithEmailAndPassword(
             
            email: _emailTextController.text,
            
             password: _passwordTextController.text)
             .then((user) => {
               

               _userServices.createUser(                //user create ggareko
                
                 {
                 'username' : _nameTextController.text,
                 'email' : _emailTextController.text,
                 'userId' : firebaseUser.uid,
                 'gender' : gender,
               }
               
               )
               
            }).catchError((err) => {print(err.toString())});
            print('six');  //print 6 test

            Navigator.pushReplacement(
              
          context, MaterialPageRoute(builder: (context) => homePage()));
    }
    
      }
    }
  }

