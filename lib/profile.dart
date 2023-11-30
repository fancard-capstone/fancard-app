import 'app_setting.dart';
import 'update_phone.dart';
import 'package:flutter/material.dart';
import 'email_update.dart';
import 'update_photo.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic>
      responseBody; // Add this line to declare responseBody

  const ProfilePage({Key? key, required this.responseBody}) : super(key: key);

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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.responseBody[
                              'https://randomuser.me/api/portraits/men/73.jpg'] ??
                          'https://randomuser.me/api/portraits/men/73.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /*Container(
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
              ),*/
              const SizedBox(height: 8.0),
              // Email address
              Text(
               "${widget.responseBody['firstName']} ${widget.responseBody['lastName']}", // Replace with the actual email address
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              // Five buttons aligned vertically
              CustomButton('Update Email', () {
                navigateToPage(
                    context, emailUpdate(responseBody: widget.responseBody));
              }),
              CustomButton('Update Phone', () {
                navigateToPage(
                    context, updatePhone(responseBody: widget.responseBody));
              }),
              CustomButton('Update Photo', () {
                navigateToPage(context, const UpdatePhoto());
              }),
              CustomButton('App Setting', () {
                navigateToPage(context, const appSetting());
              }),
              CustomButton('Log Out', () {
                showLogoutConfirmation(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

void showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              // Dismiss the dialog
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Perform log-out logic and navigate to login
              // Your log-out logic goes here (e.g., clearing authentication tokens)
              // ...

              // Navigate to the login screen
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
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
