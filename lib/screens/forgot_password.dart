import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/shared/colors.dart';
import 'package:greenify/shared/constant.dart';
import 'package:greenify/shared/snackBar.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    emailcont.dispose();
    super.dispose();
  }

 resetpassword() async {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator(color: Colors.white));
    },
  );

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcont.text);

    // التأكد أن الصفحة موجودة قبل أي تحديث
    if (!mounted) return;

    // أغلق مؤشر التحميل قبل أي Snackbar أو تنقل
    Navigator.pop(context);
// التنقل بعد الإغلاق
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),

    );
    
  } on FirebaseAuthException catch (e) {
    // التأكد أن الصفحة موجودة قبل أي تحديث
    if (!mounted) return;

    // أغلق مؤشر التحميل قبل عرض رسالة الخطأ
    Navigator.pop(context);

    
    String message;
    if (e.code == "user-not-found") {
      message = "No user found for this email.";
    } else if (e.code == "invalid-email") {
      message = "The email address is not valid.";
    } else if (e.code == "too-many-requests") {
      message = "Too many requests. Try again later.";
    } else {
      message = "Something went wrong: ${e.message}";
    }

    showSnakeBar(context, message);
  }

  // stop indicator
  if (!mounted) return;

      Navigator.pop(context);
    

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset password"), elevation: 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter your email to reset your password",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 33),
                TextFormField(
                  controller: emailcont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: decorationTextField.copyWith(
                    hintText: "Enter Your Email :",
                    suffixIcon: Icon(Icons.email),
                  ),
                  validator: (email) {
                    return email != null &&
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(email)
                        ? null
                        : "Enter a valid email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 33),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      resetpassword();
                    } else {
                      showSnakeBar(context, "ERROR");
                    }
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
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text("Reset password", style: TextStyle(fontSize: 19)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





//
//
//
//
//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:greenify/screens/login.dart';
// import 'package:greenify/screens/registar.dart';
// import 'package:greenify/shared/colors.dart';
// import 'package:greenify/shared/constant.dart';
// import 'package:greenify/shared/snackBar.dart';

// class ForgotPassword extends StatefulWidget {
//   ForgotPassword({super.key});

//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {

// TextEditingController emailcont = TextEditingController();
//   TextEditingController passwordcont = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
  
//   resetpassword() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Center(child: CircularProgressIndicator(color: Colors.white));
//       },
//     );
//     try{
//     final credential=await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcont.text);

//     }on FirebaseAuthException catch(e){
//       showSnakeBar(context, "ERROR:${e.code}");

//     }
//     //stop indicator
//     if(!mounted)return;
//     Navigator.pop(context);
//     showSnakeBar(context, "Done-please check ur email");

//     }

//   @override
//   void dispose() {
//     emailcont.dispose();

//     super.dispose();
//   }

 
   
//   }

   

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Reset password"), elevation: 0),

//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(33),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Enter your email rest your password",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(height: 33),
//                 TextFormField(
                
//                   validator: (email) {
//                     return email!.contains(
//                           RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
//                         )
//                         ? null
//                         : "Enter a vaild email";
//                   },
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: emailcont,
//                   keyboardType: TextInputType.emailAddress,
//                   obscureText: false,
//                   decoration: decorationTextField.copyWith(
//                     hintText: "Enter Your Email :",
//                     suffixIcon: Icon(Icons.email),
//                   ),
//                 ),
//                 SizedBox(height: 33),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       resetpassword();
//                     } else {
//                       showSnakeBar(context, "ERROR");
//                     }
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(BTNgreen),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     padding: MaterialStateProperty.all(EdgeInsets.all(12)),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
            
//                   child: isLoading
//                       ? CircularProgressIndicator()
//                       : Text("Reset password", style: TextStyle(fontSize: 19)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

