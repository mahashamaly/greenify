import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/shared/colors.dart';
import 'package:greenify/shared/constant.dart';
import 'package:greenify/shared/snackBar.dart';
import 'package:provider/provider.dart';

class Registar extends StatefulWidget {
  Registar({super.key});

  @override
  State<Registar> createState() => _RegistarState();
}

class _RegistarState extends State<Registar> {
  bool isLoading = false;
  bool isvisibi = true;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


bool ispassword8characters=false;
bool ispassswordAtLeast1number=false;
bool ispasswodHasUppercase=false;
bool ispasswordLowercase=false;
bool ispasswordHasSpecialCharacters=false;


  passwordChanged(String password){
    //عملت هيك علشان لمن ارجع احذف رقم يشيل التشك
    //باختصار، إعادة التصفير قبل setState ضروري لتحديث الحالة بشكل صحيح عند كل تغيير للباسورد.
    ispassword8characters=false;
    ispassswordAtLeast1number=false;
    ispasswodHasUppercase=false;
      ispasswordLowercase=false;
    ispasswordHasSpecialCharacters=false;
setState(() {
  if( password.contains(RegExp(r'^.{8,}$'))){
    ispassword8characters=true;

  }if(password.contains(RegExp(r'(?=.*\d)'))){
    ispassswordAtLeast1number=true;

  }if(password.contains(RegExp(r'(?=.*[A-Z])'))){
ispasswodHasUppercase=true;
  }if(password.contains(RegExp(r'(?=.*[a-z])'))){
ispasswordLowercase=true;
  }if(password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
ispasswordHasSpecialCharacters=true;
  }
 
});
  }

  registar() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnakeBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnakeBar(context, "The account already exists for that email.");
      } else {
        showSnakeBar(context, "Error-please try again late");
      }

      //إذا كان خطأ آخر غير معروف
    } catch (e) {
      showSnakeBar(context, e.toString());
    }
    //انهاء التحميل
    setState(() {
      isLoading = false;
    });
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
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
      title: Text("Register"),
      elevation: 0,
    ),
    
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
    
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Name :",
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 33),
                  TextFormField(
                    validator: (email) {
                      return email!.contains(
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                          )
                          ? null
                          : "Enter a vaild email";
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Email :",
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 33),
                  TextFormField(
                    onChanged: (password) {
                      passwordChanged(password);
                    },
                    validator: (value) {
                      return value!.length < 8
                          ? "Enter at least 8 characters"
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isvisibi ? true : false,
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
                  SizedBox(height: 15),
    
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:ispassword8characters?Colors.green: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text("At least 8 characters"),
                    ],
                  ),
                  SizedBox(height: 15),
    
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                        color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:   ispassswordAtLeast1number ?  Colors.green :  Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text("At least 1 number"),
                    ],
                  ),
                  SizedBox(height: 15),
    
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:ispasswodHasUppercase?Colors.green: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text("Has Uppercase"),
                    ],
                  ),
                  SizedBox(height: 15),
    
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:ispasswordLowercase?Colors.green: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text("Has Lowercase"),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:ispasswordHasSpecialCharacters?Colors.green: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(width: 11),
                      Text("Has Special Characters"),
                    ],
                  ),
                  SizedBox(height: 15),
    
                  SizedBox(height: 33),
                  ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        //هنا لو ما حطيت اويت راح تشتغل الفنكش رجيستر والسناك مع بعض هيك ما بنفع لازم استنى الرجستر يخلص بعدها اظهر السناك
                       await registar(); // استنى التسجيل يخلص
                       if(!mounted)return; // تأكد الصفحة لسه مفتوحة
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );// آمن الآن نستخدم context
                      } else {
                        showSnakeBar(context, "ERROR");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(BTNgreen),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
    
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text("Register", style: TextStyle(fontSize: 19)),
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
