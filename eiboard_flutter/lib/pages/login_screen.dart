import '../themes/light_standard_theme.dart';
import '/../pages/components/button.dart';
import '/../pages/signup_screen.dart';
import 'components/backend_rapla.dart';
import 'components/email_input_field.dart';
import 'components/password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final bool userAlreadyExists;
  final String emailIfUserExists;
  const LoginScreen(
      {Key? key, this.userAlreadyExists = false, this.emailIfUserExists = ''})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _userAlreadyExists = false;
  bool wrongEmailOrPassword = false;

  @override
  void initState() {
    super.initState();
    _userAlreadyExists = widget.userAlreadyExists;
    _emailController.text = widget.emailIfUserExists;
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                        if (_userAlreadyExists)
                          const Column(children: [
                            SizedBox(height: 40),
                            Text(
                              'This E-Mail is already registered',
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.3,
                                  color: LightStandardTheme.colorError),
                            ),
                            Text(
                              'Try logging in instead',
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.3,
                                  color: LightStandardTheme.colorError),
                            ),
                          ]),
                        if (widget.userAlreadyExists == false)
                          const SizedBox(height: 50),
                        const Image(
                          height: 250,
                          width: 250,
                          image: AssetImage('images/logoEiBoard.png'),
                        ),
                        const SizedBox(height: 30),
                        if (wrongEmailOrPassword)
                          const Column(children: [
                            Text(
                              'Wrong E-Mail or Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  height: 1.3,
                                  color: LightStandardTheme.colorError),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ]),
                        EMailInputField(
                          controller: _emailController,
                        ),
                        const SizedBox(height: 15),
                        PasswordInputField(
                          repeatPassword: false,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 20),
                        Button(
                          "LOGIN",
                          () {
                            setState(() {
                              _userAlreadyExists = false;
                            });
                            if (_formKey.currentState!.validate()) {
                              HttpRequest.sendTokenRequest(
                                  context,
                                  _emailController.text,
                                  _passwordController.text);
                              setState(() {
                                wrongEmailOrPassword = true;
                              });
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
