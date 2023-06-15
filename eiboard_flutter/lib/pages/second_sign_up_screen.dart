import '/../pages/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/custom_drawer.dart';
import 'components/sign_up_text_form_field.dart';

class SecondSignUpScreen extends StatefulWidget {
  final String userEmail;
  const SecondSignUpScreen({Key? key, required this.userEmail})
      : super(key: key);

  @override
  State<SecondSignUpScreen> createState() => _SecondSignUpScreenState();
}

class _SecondSignUpScreenState extends State<SecondSignUpScreen> {
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void createUser() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = widget.userEmail;
  }

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
                          'GET STARTED',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Why don\'t you tell us',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                        const Text(
                          ' a little about yourself?',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Image(
                          height: 250,
                          width: 250,
                          image: AssetImage('images/logoEiBoard.png'),
                        ),
                        const SizedBox(height: 20),
                        SignUpTextFormField(
                          labelText: 'Your first name',
                          controller: _firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field can not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        SignUpTextFormField(
                          labelText: 'Your last name',
                          controller: _lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field can not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Button(
                          "GET STARTED",
                          () {
                            if (_formKey.currentState!.validate()) {
                              createUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const CustomDrawer();
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )))));
  }
}
