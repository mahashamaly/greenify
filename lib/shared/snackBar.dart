
import 'package:flutter/material.dart';

showSnakeBar(BuildContext context,String text){
return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),
   duration: Duration(seconds: 4),
   action: SnackBarAction(label: "close", onPressed: (){}),
   
   
   
   
   ),
   
   
   
   
   );

}