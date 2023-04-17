import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Text("Email: "),
                    SizedBox(height: 5.0),
                    TextFormField(
                      controller: _emailField,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Email'),
                    ),
                    SizedBox(height: 15.0),
                    Text("Password: "),
                    SizedBox(height: 5.0),
                    TextFormField(
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
                            onPressed: () {},
                            child: const Text(
                              "Login!",
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
                        Text("Create Account!"),
                        TextButton(
                          onPressed: () {},
                          child: Text("Sign UP"),
                        ),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password!"),
                      ),
                    ),
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
