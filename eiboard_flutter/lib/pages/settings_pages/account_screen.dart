import 'package:google_fonts/google_fonts.dart';

import '../../utils/user_preferences.dart';
import '../change_password_screen.dart';
import '../components/button.dart';
import '../components/custom_drawer.dart';
import '../components/custom_text_form_field.dart';
import '../components/profile_widget.dart';
import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _raplaURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void updateUserCredentials() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String eMail = _emailController.text;
    final String raplaURL = _raplaURLController.text;
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.user;
    _lastNameController.text = user.lastName;
    _firstNameController.text = user.firstName;
    _emailController.text = user.email;
    _raplaURLController.text = user.raplaURL;
    TextDecoration textDecoration = TextDecoration.none;
    //TODO: add possibility for profile picture
    return PageBackground(
        topic: 'My Account',
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                labelText: 'First Name',
                controller: _firstNameController,
              ),
              CustomTextFormField(
                labelText: 'Last Name',
                controller: _lastNameController,
              ),
              CustomTextFormField(
                labelText: 'E-Mail',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can not be empty';
                  }
                  final emailRegex = RegExp(
                      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z\d]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                labelText: 'Rapla URL',
                controller: _raplaURLController,
              ),
              const SizedBox(
                height: 30,
              ),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChangePasswordScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "Change Password",
                  style: GoogleFonts.karla(
                      fontWeight: FontWeight.w700,
                      textStyle: const TextStyle(fontSize: 18)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Button(
                      'Save',
                      () {
                        if (_formKey.currentState!.validate()) {
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
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
