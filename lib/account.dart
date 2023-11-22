import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Aligns widgets to the start (top) of the column
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 0), // Increased space at the top

            SizedBox(
              width: 270,
              height: 100, // Increased height of the Account Summary box
              child: CustomButton('Account Summary', () {
                // Add the functionality for the Account Summary button
              }, isRounded: false), // Account Summary button

            ),

            const SizedBox(height: 80), // Increased spacing between Account Summary and FC meal plan

            Container(
              width: 270,
              height: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFF3EDF7),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FC meal plan: \$0.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8), // Adjust spacing between texts as needed
                  Text(
                    'Something: \$3.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50), // Adjust spacing between FC meal plan and buttons

            CustomButton('Show Transaction History', () {
              // Add the functionality for the Show Transaction History button
            }, isRounded: true, width: 270, borderRadius: 30), // Rounder corners for Show Transaction History button

            CustomButton('Add Money', () {
              // Add the functionality for the Add Money button
            }, isRounded: true, width: 270, borderRadius: 30), // Rounder corners for Add Money button
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isRounded;
  final double width;
  final double borderRadius;

  const CustomButton(this.buttonText, this.onPressed, {Key? key, this.isRounded = true, this.width = 200, this.borderRadius = 8.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: isRounded ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}