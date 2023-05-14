import '/../pages/components/button.dart';
import '/../pages/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

//still need to fully implement, add Errors

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextDecoration textDecoration = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'SIGN UP',
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
                    SizedBox(
                      width: 302,
                      height: 69,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter E-Mail",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      //TODO: manage so that you can see textfield when entering input
                      width: 302,
                      height: 69,
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      "SIGN UP",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CustomDrawer();
                            },
                          ),
                        );
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
                ))));
  }
}
