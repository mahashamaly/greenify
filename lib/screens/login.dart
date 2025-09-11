import 'package:flutter/material.dart';
import 'package:greenify/shared/custom_textfaild.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(33.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 64,
            ),
            CustomTextfaild(textInputType:TextInputType.emailAddress , hintText: 'Enter Your Email: ', obscureText: false,),
            SizedBox(
              height: 33,
            ),
             CustomTextfaild(textInputType:TextInputType.visiblePassword , hintText: 'Enter Your Password :', obscureText: true,),
            
          ],
        ),
      ),


    );
  }
}