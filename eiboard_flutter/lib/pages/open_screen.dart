import 'package:eiboard_flutter/pages/components/backend_rapla.dart';
import 'package:eiboard_flutter/pages/components/button.dart';
import 'package:eiboard_flutter/pages/login_screen.dart';
import 'package:eiboard_flutter/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import '../themes/light_standard_theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              'WELCOME TO EIBOARD',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'With eiBoard you can keep track',
              style: TextStyle(
                fontSize: 16,
                height: 1.3,
              ),
            ),
            const Text(
              'of all your assignments, classes,',
              style: TextStyle(
                fontSize: 16,
                height: 1.3,
              ),
            ),
            const Text(
              'appointments and todos.',
              style: TextStyle(
                fontSize: 16,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Being organized has\nnever been so easy!',
              style: TextStyle(
                fontSize: 16,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 20),
            const Image(
              height: 250,
              width: 250,
              image: AssetImage('images/logoEiBoard.png'),
            ),
            const SizedBox(height: 20),
            Button(
              "LOGIN",
              () {
                HttpRequest req = HttpRequest();
                req.fetchData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
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
              child: Text(
                'SIGN UP',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
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
            Radius.circular(70),
          ),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
