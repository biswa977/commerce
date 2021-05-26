import 'package:flutter/material.dart';

class ReusablePart extends StatelessWidget {
  
  ReusablePart({this.icon, this.text});
  Icon icon ;
  Text text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
    
    child: ListTile(
      title: text,
      leading: icon,
    ),
                 );
  }
}