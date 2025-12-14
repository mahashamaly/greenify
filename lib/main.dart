import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greenify/firebase_options.dart';
import 'package:greenify/models/item.dart';
import 'package:greenify/provider/cart.dart';
import 'package:greenify/screens/checkout.dart';
import 'package:greenify/screens/details_screen.dart';
import 'package:greenify/screens/home.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/screens/registar.dart';
import 'package:greenify/screens/verify-email.dart';
import 'package:greenify/shared/colors.dart';
import 'package:greenify/shared/snackBar.dart';

import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){return Cart();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: appBarGreen,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
            toolbarTextStyle: TextStyle(color: Colors.white,fontSize: 18),
            
      
          )
        ),
        home:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,Snapshot){
            //هنا الستريم لم يرسل بيانات بعد او هناك تأخير بالاتصال بالفير بيز
            if(Snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
                
              );
              
              
            }
           //معناها: حدث خطأ أثناء الاتصال بـ Firebase.

            else if(Snapshot.hasError){
              return showSnakeBar(context, "something went wrong");
            }
            else if(Snapshot.hasData){
              return VerifyEmailPage();//home or verifyemail
            }else{
              return Login();
            }
          }
          )
      
      ),
    );
  }
}
