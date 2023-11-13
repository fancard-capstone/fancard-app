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
          backgroundColor: Color(0xFFFFCCCC),
          body: Center(
            child: Image.asset(
              'assets/user_profile.jpg',
              height: 250,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Buttons(),
          )),
    );
  }
}

// ignore: non_constant_identifier_names
Buttons() {
  TextButton(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused))
          return const Color.fromARGB(255, 57, 54, 244);
        return null; // Defer to the widget's default.
      }),
    ),
    onPressed: () {},
    child: const Text('TextButton'),
  );
}
