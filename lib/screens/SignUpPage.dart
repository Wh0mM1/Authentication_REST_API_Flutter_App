import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sign_up_with_node/auth/config.dart';
import 'package:sign_up_with_node/screens/LogInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  // bool _isNotValidate = false;
  void registerUser() async {
    if (_emailField.text.isNotEmpty && _passwordField.text.isNotEmpty) {
      var registerBody = {
        "email": _emailField.text,
        "password": _passwordField.text
      };
      print("test");
      var response = await http.post(
        Uri.parse(registration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(registerBody),
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['status']);
      if (jsonResponse['status']) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    }
    // else {
    //   setState(() {
    //     _isNotValidate = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(121, 52, 38, 65),
                  Color.fromARGB(219, 47, 47, 49),
                  Color.fromARGB(255, 32, 29, 28),
                ],
              )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                "https://images.news18.com/ibnlive/uploads/2016/10/Kawasaki-Ninja-H2R.jpg?impolicy=website&width=510&height=356",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(20.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: "),
                    SizedBox(height: 5.0),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailField,
                      decoration: const InputDecoration(
                          filled: true,
                          // errorText:
                          //     _isNotValidate ? "Enter proper info" : null,
                          border: OutlineInputBorder(),
                          hintText: 'Email'),
                    ),
                    const SizedBox(height: 15.0),
                    const Text("Password: "),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min 6 characters'
                          : null,
                      controller: _passwordField,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Password'),
                    ),
                    Center(
                      child: Card(
                        margin: const EdgeInsets.all(10.0),
                        color: Color.fromARGB(255, 2, 35, 62),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 194, 222, 245),
                              width: 1,
                            )),
                        elevation: 8,
                        child: Container(
                          width: 120.0,
                          child: TextButton(
                            onPressed: () {
                              registerUser();
                            },
                            child: const Text(
                              "Sign Up!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Have Account"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text("Log In"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
