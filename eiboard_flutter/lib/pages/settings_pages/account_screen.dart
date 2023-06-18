import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../model/user.dart';
import '../../themes/light_standard_theme.dart';
import '../../utils/auth_provider.dart';
import '../components/backend_rapla.dart';
import '../change_password_screen.dart';
import '../components/button.dart';
import '../components/custom_drawer.dart';
import '../components/custom_text_form_field.dart';
import '../components/profile_widget.dart';
import '/../pages/components/page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker imagePicker = ImagePicker();
  File? image;
  String? imageBase64;
  User? user;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final String? userID = authProvider.userID;
    final String? bearerToken = authProvider.bearerToken;

    if (userID != null && bearerToken != null) {
      HttpRequest.getUser(userID, bearerToken, context).then((retrievedUser) {
        setState(() {
          user = retrievedUser;
          _lastNameController.text = user!.lastName!;
          _firstNameController.text = user!.firstName!;
          _emailController.text = user!.email!;
          _raplaURLController.text = user!.raplaURL!;
        });
      });
    }
  }

  void updateUserCredentials() {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String eMail = _emailController.text;
    final String raplaURL = _raplaURLController.text;
    final String? imagePath = imageBase64;
  }

  @override
  Widget build(BuildContext context) {
    TextDecoration textDecoration = TextDecoration.none;

    return PageBackground(
        topic: 'My Account',
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ProfileWidget(
                  image: image != null
                      ? Image.network(
                          image!.path,
                          fit: BoxFit.cover,
                          width: 110,
                          height: 110,
                        )
                      : (user!.imagePath != null
                          ? Image.memory(
                              base64Decode(user!.imagePath!),
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            )
                          : Image.asset(
                              'images/profilePicture.jpg',
                              fit: BoxFit.cover,
                              width: 110,
                              height: 110,
                            )),
                  onClicked: () async {
                    openImagePicker();
                  }),
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
                          updateUserCredentials();
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

  Future pickImage() async {
    try {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        getImageBase64(imageTemporary);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void getImageBase64(File imageTemp) async {
    final response = await http.get(Uri.parse(imageTemp.path));

    if (response.statusCode == 200) {
      List<int> imageBytes = response.bodyBytes;
      String base64Image = base64.encode(imageBytes);
      setState(() {
        imageBase64 = base64Image;
      });
    } else {
      print('Failed to fetch image: ${response.statusCode}');
    }
  }

  void openImagePicker() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: LightStandardTheme.colorPrimary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    child: Text(
                      'Upload Image',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      pickImage();
                    },
                  ),
                ),
              ));
        });
  }
}
