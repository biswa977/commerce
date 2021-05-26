import 'package:firebase_database/firebase_database.dart';
//import 'package:seller/pages/signup.dart';

class UserServices {
  
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = 'users';

  createUser( Map value) {                        //child ref is creating new node
  print('seven');  
    String id =  value['userId'];
    _database.reference().child('$ref /$id').set(   //child(ref).push().set use garyo vane automatically id create gardincha user ko lagi
      value                                         //child('$ref /$uid')id of the record lai table vitra halna lai chai yo use garne
    ).catchError((e)=>{print (e.toString())});      //aba uid chai default id of the table huncha table name chai users ho
  }
  
   
}