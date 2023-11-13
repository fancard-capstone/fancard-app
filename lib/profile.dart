import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFFFFCCCC),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular image
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
                'Group5@fanshaweonline.ca', // Replace with the actual email address
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              // Five buttons
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton('Update Email'),
                  CustomButton('Update Phone'),
                  CustomButton('Update Photo'),
                  CustomButton('App Setting'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton(this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your button click logic here
        },
        child: Text(buttonText),
      ),
    );
  }
}
