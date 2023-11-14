import 'appSetting.dart';
import 'updatePhone.dart';
import 'package:flutter/material.dart';
import 'emailupdate.dart';
import 'updatePhoto.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 247, 247),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/user_image.jpg'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // Email address
              const Text(
                'user@example.com', // Replace with the actual email address
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              // Five buttons aligned vertically
              CustomButton('Update Email', () {
                navigateToPage(context, const emailUpdate());
              }),
              CustomButton('Update Phone', () {
                navigateToPage(context, const updatePhone());
              }),
              CustomButton('Update Photo', () {
                navigateToPage(context, const updatePhoto());
              }),
              CustomButton('App Setting', () {
                navigateToPage(context, const appSetting());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton(this.buttonText, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
