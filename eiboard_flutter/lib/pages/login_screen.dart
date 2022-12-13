import 'package:eiboard_flutter/pages/calendar_screen.dart';
import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//still need to fully implement, add errors

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextDecoration td = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            true, //need to set to true otherwise won't be able to see all boxes
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                //to avoid overflow
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
                          //fillColor: Colors.green
                        ),
                        /*validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },*/
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
                          //fillColor: Colors.green
                        ),
                        /*validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },*/
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
                              return const CalendarScreen();
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
                          decoration: td,
                        ),
                      ),
                      onHover: (hasHover) {
                        if (hasHover == true) {
                          setState(() {
                            td = TextDecoration.underline;
                          });
                        } else {
                          setState(() {
                            td = TextDecoration.none;
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
