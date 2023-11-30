import 'package:flutter/material.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddMoneyPageState createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  String selectedAccount = 'Fancard'; // Default selected account
  double amountToAdd = 0.0; // Default amount
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Select Account: '),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: selectedAccount,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedAccount = newValue!;
                    });
                  },
                  items: <String>['Fancard', 'FC Flex Plan']
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Amount to Add: '),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    onChanged: (value) {
                      setState(() {
                        amountToAdd = double.parse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '(MIN \$5, Max \$500 CAD)',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      amountToAdd = 10.0;
                      amountController.text = '10';
                    });
                  },
                  child: const Text('\$10'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      amountToAdd = 20.0;
                      amountController.text = '20';
                    });
                  },
                  child: const Text('\$20'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      amountToAdd = 50.0;
                      amountController.text = '50';
                    });
                  },
                  child: const Text('\$50'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle add funds button logic
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                ),
                child: const Text('Add Funds'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
