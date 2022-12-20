import 'package:bylaive/Authentication/SignUp.dart';
import 'package:bylaive/Authentication/Userredirect.dart';
import 'package:bylaive/Splash.dart';
import 'package:bylaive/Authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginpage;

  const SignUp({Key? key, required this.showLoginpage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;
  bool isChecked = false;
  bool newValue = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Container(
        height: MediaQuery.of(context).size.height,
        key: _formKey,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.postimg.cc/VNzmWn6r/IMG-20221020-WA0005.jpg"),
                        fit: BoxFit.cover)),
                height: 110,
                width: 110,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Welcome',
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
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
                    height: 15,
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.mail),
                      hintText: 'Email',
                      //   helperText: 'Helper Text',
                      //  counterText: '0 characters',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Color(0xFFFCAF3B)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      }),
                  Text("Please accept our"),
                  TextButton(
                      onPressed: () {}, child: Text('terms and conditions.'))
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFCAF3B),
                ),
                onPressed: () async {
                  _register();
                },
                child: Text('SignUp')),
            TextButton(
                onPressed: () {
                  widget.showLoginpage();
                },
                child: Text('Already have?Login')),
            const SizedBox(
              height: 5,
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

  Future<void> _register() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
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
