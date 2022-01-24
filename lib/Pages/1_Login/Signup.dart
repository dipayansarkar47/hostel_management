import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hostel_management_app/Pages/1_Login/LogInPage.dart';
import 'package:hostel_management_app/Pages/2_Home/HomePage.dart';
import 'package:hostel_management_app/model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  // editing controllers
  final firstNameEditingTextController = new TextEditingController();
  final secondNameEditingTextController = new TextEditingController();
  final emailNameEditingTextController = new TextEditingController();
  final passwordNameEditingTextController = new TextEditingController();
  final confirmpasswordNameEditingTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      controller: firstNameEditingTextController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_sharp),
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) => firstNameEditingTextController.text = value!,
    );
    final lastNameField = TextFormField(
      controller: secondNameEditingTextController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_sharp),
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) => secondNameEditingTextController.text = value!,
    );
    final emailField = TextFormField(
      controller: emailNameEditingTextController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
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
      onSaved: (value) => emailNameEditingTextController.text = value!,
    );
    final passwordField = TextFormField(
      controller: passwordNameEditingTextController,
      obscureText: true,
      autofocus: false,
      textInputAction: TextInputAction.next,
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
        prefixIcon: Icon(Icons.lock_outline),
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) => passwordNameEditingTextController.text = value!,
    );
    final confirmpasswordField = TextFormField(
      controller: confirmpasswordNameEditingTextController,
      obscureText: true,
      autofocus: false,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (confirmpasswordNameEditingTextController.text !=
            passwordNameEditingTextController.text) {
          return "Password don't match";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onSaved: (value) =>
          confirmpasswordNameEditingTextController.text = value!,
    );
    final SignupButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          color: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text("Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            signUp(emailNameEditingTextController.text,
                passwordNameEditingTextController.text);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LogInScreen()));
          },
        ));
    return Scaffold(
      backgroundColor: HexColor("ffffff"),
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
                        'images/log.gif',
                      ),
                    ),
                    SizedBox(height: 30.0),
                    firstNameField,
                    SizedBox(height: 30.0),
                    lastNameField,
                    SizedBox(height: 30.0),
                    emailField,
                    SizedBox(
                      height: 30.0,
                    ),
                    passwordField,
                    SizedBox(
                      height: 30.0,
                    ),
                    confirmpasswordField,
                    SizedBox(height: 30.0),
                    SignupButton,
                    SizedBox(
                      height: 15.0,
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingTextController.text;
    userModel.secondName = secondNameEditingTextController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
