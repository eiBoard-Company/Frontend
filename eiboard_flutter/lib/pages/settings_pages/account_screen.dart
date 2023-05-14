import '/../pages/components/page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.user;
    return PageBackground(
      topic: 'My Account',
      showPlusIcon: false,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ProfileWidget(imagePath: user.imagePath, onClicked: () async {}),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Button(
                  'Save',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const MainScreen();
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
