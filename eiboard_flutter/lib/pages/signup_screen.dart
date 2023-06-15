import '/../pages/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/email_input_field.dart';
import 'components/password_input_field.dart';
import 'login_screen.dart';
import 'second_sign_up_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'SIGN UP',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Image(
                          height: 250,
                          width: 250,
                          image: AssetImage('images/logoEiBoard.png'),
                        ),
                        const SizedBox(height: 20),
                        const EMailInputField(),
                        const SizedBox(height: 15),
                        const PasswordInputField(repeatPassword: true),
                        const SizedBox(height: 20),
                        Button(
                          "SIGN UP",
                          () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SecondSignUpScreen();
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
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Already have an account? Sign in.",
                            style: GoogleFonts.karla(
                                textStyle: const TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    )))));
  }
}
