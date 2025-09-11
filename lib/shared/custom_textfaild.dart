import 'package:flutter/material.dart';

class CustomTextfaild extends StatelessWidget {
  const CustomTextfaild({super.key, required this.textInputType, required this.hintText, required this.obscureText});
       
  final TextInputType textInputType;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return  TextField(
           keyboardType: textInputType,
           obscureText: obscureText,
           decoration: InputDecoration(
            hintText: hintText,
            //to delet border
            enabledBorder: OutlineInputBorder(borderSide:Divider.createBorderSide(context)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            filled: true,
            contentPadding: EdgeInsets.all(8)
        
           ),
        
            );






    
  }
}