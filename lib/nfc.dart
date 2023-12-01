import 'dart:async';

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NFCPage extends StatefulWidget {
  const NFCPage({super.key});

  @override
  State<NFCPage> createState() => _NFCPageState();
}

class _NFCPageState extends State<NFCPage> {
  static const platform = MethodChannel('fancardplus-user-id-nfc');

  String _batteryLevel = '';
  bool _loading = false;

  @override
  void initState() {
    print("intializing nfc");
    _setUserId();
    super.initState();
  }

  Future<void> _setUserId() async {
    String batteryLevel;
    try {
      _loading = true;
      final result = await platform.invokeMethod<String>('startNFCHCE', "77");

      print(result);

      batteryLevel = "Transaction Successfull";
    } on PlatformException catch (e) {
      batteryLevel = "Failed transaction: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
    _loading = false;
  }

  Future<void> _noPress() async {
    _setUserId();
    print("Checking something");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Fancard+'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _noPress,
                icon: Icon(
                  Icons.nfc,
                  size: 200,
                  color: _loading ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
