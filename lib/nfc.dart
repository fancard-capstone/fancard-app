import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart';

class NFCPage extends StatefulWidget {
  const NFCPage({super.key});

  @override
  State<NFCPage> createState() => _NFCPageState();
}

class _NFCPageState extends State<NFCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Fancard+'),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.nfc, size: 200),
            ],
          )
        ],
      ),
    );
  }
}
