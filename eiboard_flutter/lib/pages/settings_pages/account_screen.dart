import 'package:google_fonts/google_fonts.dart';

import '../../utils/user_preferences.dart';
import '../components/button.dart';
import '../components/custom_drawer.dart';
import '../components/profile_widget.dart';
import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.user;
    return PageBackground(
      topic: 'My Account',
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              initialValue: user.firstName,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'First Name'),
            ),
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              initialValue: user.lastName,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Last Name'),
            ),
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              initialValue: user.email,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'E-Mail'),
            ),
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              initialValue: user.raplaURL,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Rapla URL'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text('Create New Password',
              style: GoogleFonts.karla(fontWeight: FontWeight.w600)),
          SizedBox(
            width: 337,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Old Password'),
            ),
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'New Password'),
            ),
          ),
          SizedBox(
            width: 337,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'New Password'),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
