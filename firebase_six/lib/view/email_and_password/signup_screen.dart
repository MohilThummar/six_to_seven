import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../res/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Enter First Name",
                labelText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: lastNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Enter Last Name",
                labelText: "Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter Number",
                labelText: "Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
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
                createUser();
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(200, 50)),
              ),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }

  createUser() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
        debugPrint("Value --> ${value.user}");
        user = value.user;
        user!.sendEmailVerification();

        createUserData();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak. -->');
        utils.showSnackBar(context, message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email. -->');
        utils.showSnackBar(context, message: "The account already exists for that email.");
      }
    } catch (e) {
      debugPrint("Error ->> $e");
    }
  }

  createUserData() {
    CollectionReference users = firebaseFireStore.collection('user');

    users.doc(user!.uid).set({
      'id': user!.uid,
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'number': numberController.text,
      'email': user!.email,
    }).then((value) {
      debugPrint("User Added --> ");
      utils.showToastMessage(message: "SignUp is complete, Please verify your email.");
      Navigator.pop(context);
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }
}
