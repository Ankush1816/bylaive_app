import 'dart:async';
import 'package:bylaive/Authentication/Authuser.dart';
import 'package:bylaive/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:ezyqure/Pages/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => AuthUser()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFF2DED8),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network('https://assets9.lottiefiles.com/packages/lf20_y2v4toul.json',height: 250),
            SizedBox(height: 10,),
            Text('Bylaive',style: GoogleFonts.robotoSlab(color: Color(0xFFFCAF3B),fontWeight: FontWeight.bold,fontSize: 40)),
            SizedBox(height: 25,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>( Color(0xFFFCAF3B)),
            )
          ],
        ),
      ),
    );
  }
}
