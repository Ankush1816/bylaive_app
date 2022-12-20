import 'package:bylaive/Splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Authentication/Userredirect.dart';
import 'firebase_options.dart';
import 'Authentication/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // final FirebaseAuth _auth = FirebaseAuth.instance;
  //  final GoogleSignIn _googleSignIn = GoogleSignIn();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        hintColor: Color(0xFFFCAF3B),
        primaryColor: Color(0xFFFCAF3B),
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        hintColor: Color(0xFFFCAF3B),
        primaryColor: Color(0xFFFCAF3B),

        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: Splash(),
    );
  }
}

