import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenify/screens/forgot_password.dart';
import 'package:greenify/screens/home.dart';
import 'package:greenify/screens/registar.dart';
import 'package:greenify/screens/verify-email.dart';
import 'package:greenify/shared/colors.dart';
import 'package:greenify/shared/constant.dart';
import 'package:greenify/shared/snackBar.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    bool isvisibi = true;
      bool isLoading = false;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  signIn() async {
  // فتح Dialog التحميل
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(
      child: CircularProgressIndicator(color: Colors.white),
    ),
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (!mounted) return;
    Navigator.of(context).pop(); // غلق Dialog

    // عرض SnackBar نجاح
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Welcome back!")),
    );

    // الانتقال للصفحة الرئيسية
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Home()),
    );

  } on FirebaseAuthException catch (e) {
    if (!mounted) return;
    Navigator.of(context).pop(); // غلق Dialog عند الخطأ

    String message = "Something went wrong.";
    if (e.code == 'user-not-found') message = "No user found with this email.";
    if (e.code == 'wrong-password') message = "Incorrect password.";
    if (e.code == 'invalid-email') message = "Please enter a valid email address.";

    // عرض SnackBar الخطأ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

 






  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarGreen,
        title: Text("Sign in"),
      ),
       
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your Email :",
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 33),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isvisibi?true:false,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your password :",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isvisibi = !isvisibi;
                          });
                          //تغير شكل الايقونة
                        },
                        icon: Icon(
                          isvisibi ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
    
    
                  ),
                ),
                const SizedBox(height: 33),
                ElevatedButton(
                  onPressed: () async {
                    await signIn();
                    //if (!mounted) return;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmailPage()));
                  },
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
    
                  child: Text("Sign in", style: TextStyle(fontSize: 19)),
                ),
                const SizedBox(height: 9),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                }, child: Text("Forgot password ?",style: TextStyle(fontSize: 18, color: Colors.blue,   decoration: TextDecoration.underline),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Registar()),
                        );
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(color: Colors.blue, fontSize: 18,decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
