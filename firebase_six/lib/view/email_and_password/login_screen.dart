import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_six/res/utils/utils.dart';
import 'package:firebase_six/view/email_and_password/signup_screen.dart';
import 'package:firebase_six/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;
  User? userData;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  Utils utils = Utils();
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState

    // userData = FirebaseAuth.instance.currentUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(200, 50)),
              ),
              child: const Text("Login"),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              ),
              child: const Text("Create A Account"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                // final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
                signInWithGoogle();
              },
              child: const Text("Google Login"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    debugPrint("googleUser --> $googleUser");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    userData = userCredential!.user;
    debugPrint("userData --> $userData");
    utils.showToastMessage(message: "Login is successfully");
  }

  loginUser() async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
        debugPrint("Value --> ${value.user}");

        if (value.user!.emailVerified) {
          debugPrint("User is login..");
          userData = value.user;
          getUser();
        } else {
          debugPrint("Please verify the email");
          utils.showSnackBar(
            context,
            message: "Please verify the email or resent the mail",
            label: "Resent",
            onPressed: () => value.user!.sendEmailVerification(),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        utils.showSnackBar(context, message: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        utils.showSnackBar(context, message: "Wrong password provided for that user.");
      }
    }
  }

  getUser() {
    CollectionReference users = firebaseFireStore.collection('user');
    users.doc(userData!.uid).get().then((value) {
      debugPrint("User Added --> ${jsonEncode(value.data())}");
      userModel = userModelFromJson(jsonEncode(value.data()));
      utils.showToastMessage(message: "Login is successfully");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }
}
