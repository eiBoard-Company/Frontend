import 'package:eiboard_flutter/pages/components/backend_rapla.dart';
import 'package:http/http.dart';

import '/../pages/components/button.dart';
import '/../pages/components/custom_drawer.dart';
import '/../pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO: still need to fully implement, add errors

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextDecoration textDecoration = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Center(
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
                        autofocus: true,
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
                      "LOGIN",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              print('Hallo Matteo');
                              Future<Response> fs = HttpRequest.fetchData(
                                  HttpRequest.url + HttpRequest.user);
                              fs.then((value) => print(value.body));
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
                ))));
  }
}
