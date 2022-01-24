import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hostel_management_app/Pages/2_Home/BottomNav.dart';
import 'package:hostel_management_app/Pages/2_Home/HomePage.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an email';
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) => emailController.text = value!,
    );

    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      autofocus: false,
      textInputAction: TextInputAction.done,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) => emailController.text = value!,
    );

    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          color: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text("Log in",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            signIn(emailController.text, passwordController.text);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavigations()));
          },
        ));
    return Scaffold(
      backgroundColor: HexColor("4cdeef"),
      body: Container(
        child: Center(
            child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        'images/animation.gif',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    emailField,
                    SizedBox(
                      height: 30.0,
                    ),
                    passwordField,
                    SizedBox(
                      height: 30.0,
                    ),
                    loginButton,
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/signup'),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 15.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  //signin
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              })
          .catchError((e) => {
                Fluttertoast.showToast(msg: e.message),
              });
    }
  }
}
