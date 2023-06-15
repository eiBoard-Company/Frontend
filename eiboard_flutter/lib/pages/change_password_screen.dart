import '/../pages/components/page.dart';
import 'package:flutter/material.dart';
import 'components/button.dart';
import 'components/custom_old_password_field_for_account.dart';
import 'components/custom_password_field_for_account.dart';
import 'settings_pages/account_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void updatePassword() {}

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        topic: 'Change Password',
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              OldPasswordInputFieldAccount(
                controller: _oldPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can not be empty';
                  }
                  return null;
                },
              ),
              PasswordInputFieldAccount(
                controller: _newPasswordController,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Button(
                      'Change',
                      () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AccountScreen();
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
