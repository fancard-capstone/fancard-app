import 'dart:async';
import 'dart:convert';

import 'package:fancardplus/components/topbar.dart';
import 'package:fancardplus/constants.dart';
import 'package:fancardplus/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class NFCPage extends StatefulWidget {
  const NFCPage({Key? key, required this.studentId}) : super(key: key);

  final String studentId;

  @override
  State<NFCPage> createState() => _NFCPageState();
}

const snackBar = SnackBar(
  content: Text('Transaction Successfull!'),
  backgroundColor: Colors.green,
);

const errorSnackBar = SnackBar(
  content: Text('Transaction failed'),
  backgroundColor: Colors.red,
);

class _NFCPageState extends State<NFCPage> {
  static const platform = MethodChannel('fancardplus-user-id-nfc');

  String _batteryLevel = '';
  String errorText = '';
  bool _loading = false;

  @override
  void initState() {
    print("intializing nfc");
    _setUserId();
    super.initState();
  }

  Future<void> _setUserId() async {
    try {
      _loading = true;
      final result =
          await platform.invokeMethod<String>('startNFCHCE', widget.studentId);

      print(result);

      _addTransaction();
    } on PlatformException catch (e) {
      String batteryLevel = "Failed transaction: '${e.message}'.";
      setState(() {
        _batteryLevel = batteryLevel;
      });
    }

    _loading = false;
  }

  Future<void> _handleTimeOut() async {
    setState(() {
      errorText = 'Server is down. Please try again later.';
    });
  }

  void _handleNotice() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleErrorNotice() {
    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
  }

  Future<void> _addTransaction() async {
    try {
      final response = await http
          .post(
        Uri.parse('$baseApiUrl/transactions'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Map<String, int>>{
          "user": {"userId": int.parse(widget.studentId.toString())},
          "facility": {"facilityId": 2}
        }),
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          // Handle timeout by calling _handleDefaultResponse
          _handleTimeOut();
          // Return a dummy response with status code 408 (Request Timeout)
          return http.Response('timeout', 408);
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        _handleNotice();
      } else {
        _handleErrorNotice();
      }
    } catch (error) {
      _handleErrorNotice();
      if (error is TimeoutException) {
        // Handle timeout: Server is down or not responsive
        setState(() {
          errorText = 'Server is down. Please try again later.';
        });
      } else {
        setState(() {
          errorText =
              'Failed to connect. Please check your internet connection.';
        });
        print('Error: $error');
      }
    }
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
                onPressed: _loading ? null : _noPress,
                icon: Icon(
                  Icons.nfc,
                  size: 200,
                  color: _loading ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          Text(_batteryLevel),
          ElevatedButton(
              onPressed: () {
                final String studentId = widget.studentId;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Transactions(studentId: studentId),
                  ),
                );
              },
              child: Text("view transactions")),
        ],
      ),
    );
  }
}
