import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenify/screens/home.dart';
import 'package:greenify/screens/login.dart';
import 'package:greenify/shared/colors.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  //user → لتخزين بيانات المستخدم الحالي من Firebase. late تعني أنه سيتم تهيئته لاحقًا قبل الاستخدام.
  late User user; 
  //لمعرفة هل البريد مفعل أم لا.
  bool isEmailVerified = false; 
  //لمنع المستخدم من الضغط على زر إعادة الإرسال بسرعة كبيرة.
  bool canResendEmail = false; 

  @override
  void initState() {
    super.initState();
    checkUser(); 
  }
//هنا تستدعي checkUser() للتحقق من حالة المستخدم عند فتح الصفحة.
  Future<void> checkUser() async {
    //يجلب  المستخدم الحالى
    final currentUser = FirebaseAuth.instance.currentUser; 
//إذا المستخدم موجود:

//نخزن بياناته ب اليوزر

// حالة التحقق isEmailVerified.
    if (currentUser != null) {
      user = currentUser; 
      isEmailVerified = user.emailVerified; 

      if (!isEmailVerified) {
        await sendVerificationEmail(); 
        //ننتظر 3 ثواني قبل أن نفحص حالة البريد مرة أخرى.
        //السبب: لا نفحص مباشرة بعد الإرسال لأن المستخدم يحتاج وقت لفتح الإيميل والنقر على الرابط.
        //هذه الطريقة تسمى Polling (فحص دوري) → كل 3 ثواني نتحقق إذا البريد أصبح مفعل.
        Future.delayed(const Duration(seconds: 3), checkEmailVerified);
       
      }
    } else {
      print('No user is currently signed in');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      //1️⃣ نرسل رسالة التفعيل للبريد
      await user.sendEmailVerification();
      //2️⃣ تعطيل زر إعادة الإرسال مؤقتًا
      setState(() => canResendEmail = false); 
      //3️⃣ انتظار فترة قصيرة قبل السماح بإعادة الإرسال
      //هذا يمنح المستخدم وقت لفتح البريد أو قراءة الرسالة.
      await Future.delayed(const Duration(seconds: 5)); 
      //4️⃣ إعادة تفعيل زر الإرسال
      setState(() => canResendEmail = true); 
    } catch (e) {
      print('Error sending verification email: $e');
    }
  }
//نريد نفحص حالة البريد الإلكتروني للمستخدم لمعرفة إذا فعّل بريده أو لا.
Future<void> checkEmailVerified() async {
  await user.reload(); // لتحديث حالة المستخدم من Firebase
  setState(() {
    // تحديث حالة التفعيل بعد التحديث
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  });

  if (isEmailVerified) {
    // ✅ إذا تم تفعيل البريد الإلكتروني
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  } else {
    // ⏳ إذا لسه مش مفعّل، نرجع نفحص بعد 3 ثواني
    Future.delayed(const Duration(seconds: 3), checkEmailVerified);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: BTNgreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isEmailVerified
              ? const Text(
                  ' Email verified successfully!\nYou can now access the app.✅',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'A verification email has been sent to your inbox.📩 ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: canResendEmail ? sendVerificationEmail : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BTNgreen,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Resend Email',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),


                 
    

    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                         FirebaseAuth.instance.signOut();
                        },
                       
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
