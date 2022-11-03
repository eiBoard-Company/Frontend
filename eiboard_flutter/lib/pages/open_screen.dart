import 'package:eiboard_flutter/pages/login_screen.dart';
import 'package:eiboard_flutter/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import '../themes/light_standard_theme.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size; //getting size of screen  need to implement
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'WELCOME TO EIBOARD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),
            const Text(
              'With eiBoard you can keep track',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const Text(
              'of all your assignments, classes,',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const Text(
              'appointments and todos.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Being organized has\nnever been so easy!'),
            const SizedBox(height: 20),
            const Image(
              height: 250,
              width: 250,
              image: AssetImage('images/logoEiBoard.png'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              style: bsLogin,
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
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
              style: bsSignUp,
              child: const Text(
                'SIGN UP',
              ),
            ),
          ],
        ))));
  }

  ButtonStyle get bsSignUp {
    return ElevatedButton.styleFrom(
        minimumSize: const Size(302, 69),
        backgroundColor: LightStandardTheme.colorMain,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  ButtonStyle get bsLogin {
    return ElevatedButton.styleFrom(
        minimumSize: const Size(302, 69),
        backgroundColor: LightStandardTheme.colorPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(200),
          ),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
