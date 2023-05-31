import 'package:http/http.dart';

import '/../pages/components/button.dart';
import '/../pages/components/custom_drawer.dart';
import '/../pages/signup_screen.dart';
import 'components/backend_rapla.dart';
import 'components/email_input_field.dart';
import 'components/password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextDecoration textDecoration = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Form(
            key: _formKey,
            child: Center(
                child: SingleChildScrollView(
                    reverse: true,
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'LOGIN',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Image(
                          height: 250,
                          width: 250,
                          image: AssetImage('images/logoEiBoard.png'),
                        ),
                        const SizedBox(height: 30),
                        const EMailInputField(),
                        const SizedBox(height: 15),
                        const PasswordInputField(repeatPassword: false),
                        const SizedBox(height: 20),
                        Button(
                          "LOGIN",
                          () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    Future<Response> fs = HttpRequest.fetchData(
                                        HttpRequest.url + HttpRequest.user);
                                    fs.then((value) => print(value.body));
                                    return const CustomDrawer();
                                  },
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 12,
                              decoration: textDecoration,
                            ),
                          ),
                          onHover: (hasHover) {
                            if (hasHover == true) {
                              setState(() {
                                textDecoration = TextDecoration.underline;
                              });
                            } else {
                              setState(() {
                                textDecoration = TextDecoration.none;
                              });
                            }
                          },
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Don't have an account? Sign up.",
                            style: GoogleFonts.karla(
                                textStyle: const TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    )))));
  }
}
