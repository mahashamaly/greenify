import 'package:flutter/material.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/shared/colors.dart';
import 'package:greenify/shared/constant.dart';

class Registar extends StatelessWidget {
  const Registar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 64),

                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Name :",
                    ),
                  ),
                  SizedBox(height: 33),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Email :",
                    ),
                  ),
                  SizedBox(height: 33),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: decorationTextField.copyWith(
                      hintText: "Enter Your password :",
                    ),
                  ),
                  SizedBox(height: 33),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    child: Text("Register", style: TextStyle(fontSize: 19)),
                  ),
                  SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
