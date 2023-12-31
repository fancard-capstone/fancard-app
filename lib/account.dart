import 'package:fancardplus/add_money_page.dart';
import 'package:fancardplus/transaction_history.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final Map<String, dynamic>
      responseBody; // Add this line to declare responseBody

  const AccountPage({Key? key, required this.responseBody}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 55,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      width: 35), // Adjusted the width to maintain the spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          'Account Summary',
                          () {
                            // Add functionality for the Account Summary button
                          },
                          isRounded: false,
                          width: 200, // Width of the CustomButton
                          height: 70, // Height of the CustomButton
                        ),
                        const SizedBox(height: 8),
                        // Add more widgets related to account summary if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top:
                18, // Adjusted the top position to move the CircleAvatar down by 5 units
            left: 5,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.responseBody['imageUrl'] ??
                              'https://randomuser.me/api/portraits/men/73.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 100), // Adjust this value to align with the summary box
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300, // Increased width of the summary box
                    height: 250, // Increased height of the summary box
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
                            fontSize:
                                18, // Increased font size for better visibility
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 12), // Adjusted spacing between texts
                        Text(
                          'Something: \$3.00',
                          style: TextStyle(
                            fontSize:
                                18, // Increased font size for better visibility
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    'Show Transaction History',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TransactionHistoryPage()),
                      );
                    },
                    isRounded: true,
                    width: 270,
                    height: 50, // Height of the CustomButton
                    borderRadius: 30,
                  ),
                  CustomButton(
                    'Add Money',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddMoneyPage()),
                      );
                    },
                    isRounded: true,
                    width: 270,
                    height: 50, // Height of the CustomButton
                    borderRadius: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isRounded;
  final double width;
  final double height;
  final double borderRadius;

  const CustomButton(
    this.buttonText,
    this.onPressed, {
    Key? key,
    this.isRounded = true,
    this.width = 200,
    this.height = 40, // Default height of the CustomButton
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: isRounded
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
