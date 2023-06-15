import 'package:google_fonts/google_fonts.dart';

import '../../utils/user_preferences.dart';
import '../components/button.dart';
import '../components/custom_drawer.dart';
import '../components/custom_password_field_for_account.dart';
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
  /*final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _raplaURLController = TextEditingController();*/
  final _formKey = GlobalKey<FormState>();

  void updateUserCredentials() {
    /*final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String eMail = _emailController.text;
    final String raplaURL = _raplaURLController.text;*/
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.user;
    //TODO: make possible to change user data without changing password
    //TODO: fix problem with controllers, appear to be null and not correctly initalized
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
                initialValue: user.firstName,
              ),
              CustomTextFormField(
                labelText: 'Last Name',
                initialValue: user.lastName,
              ),
              CustomTextFormField(
                labelText: 'E-Mail',
                initialValue: user.email,
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
                  labelText: 'Rapla URL', initialValue: user.raplaURL),
              const SizedBox(
                height: 30,
              ),
              Text('Create New Password',
                  style: GoogleFonts.karla(fontWeight: FontWeight.w600)),
              const CustomTextFormField(
                labelText: 'Old Password',
              ),
              const PasswordInputFieldAccount(),
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
