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
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<String>('startNFCHCE', "24");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
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
                  onPressed: _getBatteryLevel,
                  icon: const Icon(Icons.nfc, size: 200)),
            ],
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
