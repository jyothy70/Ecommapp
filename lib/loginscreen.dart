import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommapp/authentication.dart';
import 'package:ecommapp/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LoginPage"),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => HomePage())),
                );
              }),
              icon: Icon(Icons.next_plan)),
        ],
        elevation: 5,
        shadowColor: Colors.pink,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.yellow],
                begin: Alignment.center),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            child: Image.network(
                "https://thumbs.dreamstime.com/b/person-icon-flat-style-man-symbol-person-icon-flat-style-man-symbol-isolated-white-background-simple-people-abstract-icon-118611127.jpg"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "EMail"),
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            controller: emailController,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
            keyboardType: TextInputType.visiblePassword,
            maxLength: 15,
            controller: passwordController,
          ),
          ElevatedButton(
              onPressed: () async {
                await AuthenticationService(FirebaseAuth.instance)
                    .firebaseLogin(emailController.text.trim(),
                        passwordController.text.trim())
                    .then((value) {
                  if (value == "Sign in") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(value),
                      backgroundColor: Colors.red,
                    ));
                  }
                });
              },
              child: Text("Signin"))
        ],
      ),
    );
  }
}
