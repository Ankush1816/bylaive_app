import 'package:bylaive/Authentication/SignUp.dart';
import 'package:bylaive/Authentication/Userredirect.dart';
import 'package:bylaive/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Home_Pages/HomePage.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bylaive/Constants/colours.dart';


class loginpage extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const loginpage({Key? key, required this.showRegisterpage}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Container(
        height: MediaQuery.of(context).size.height,
        key: _formKey,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.postimg.cc/vBjh5tyH/Mobile-login-amico-1.png"),
                      fit: BoxFit.cover)),
              height: context.height/2,
            ),
            Text('Welcome back',style: GoogleFonts.robotoSlab(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: 'Email',
                      //   helperText: 'Helper Text',
                      //  counterText: '0 characters',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Color(0xFFFCAF3B)),
                      ),
                    ),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Password',
                      //   helperText: 'Helper Text',
                      // counterText: '0 characters',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Color(0xFFFCAF3B),
                        ),
                      ),
                    ),

                    controller: _passwordController,
                  ),
                ],
              ),
            ),



            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFCAF3B),
                ),
                onPressed: () async {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

                },
                child: Text('Login')),
            TextButton(onPressed: () {
            widget.showRegisterpage();
            },child: Text('New user? Create an account')),
            const SizedBox(
              height: 30,
            ),
            SignInButtonBuilder(
              backgroundColor: Colors.white,
              onPressed: () {
                AuthService().signInWithGoogle();
              },
              text: 'LogIn with Google',
              textColor: Colors.black38,
              image: Image.network(
                'https://i.postimg.cc/tRSMjWx7/download.png',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      )),
    );
  }



}

Widget makeinput({label, obsecureText = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 50.0, right: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        TextField(
          obscureText: obsecureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        )
      ],
    ),
  );
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
