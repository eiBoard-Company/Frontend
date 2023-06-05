import 'package:google_fonts/google_fonts.dart';

import '../../utils/user_preferences.dart';
import '../components/button.dart';
import '../components/custom_drawer.dart';
import '../components/custom_password_field_for_account.dart';
import '../components/custom_text_form_field.dart';
import '../components/profile_widget.dart';
import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final raplaURLController = TextEditingController();
    final oldPasswordController = TextEditingController();
    final user = UserPreferences.user;
    //TODO: make possible to change user data without changing password
    return PageBackground(
        topic: 'My Account',
        child: Form(
          key: formKey,
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
                controller: firstNameController,
              ),
              CustomTextFormField(
                labelText: 'Last Name',
                initialValue: user.lastName,
                controller: lastNameController,
              ),
              CustomTextFormField(
                labelText: 'E-Mail',
                controller: emailController,
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
                  labelText: 'Rapla URL',
                  controller: raplaURLController,
                  initialValue: user.raplaURL),
              const SizedBox(
                height: 30,
              ),
              Text('Create New Password',
                  style: GoogleFonts.karla(fontWeight: FontWeight.w600)),
              CustomTextFormField(
                labelText: 'Old Password',
                controller: oldPasswordController,
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
                        if (formKey.currentState!.validate()) {
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
