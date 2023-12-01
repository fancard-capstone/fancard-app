import 'dart:async';
import 'dart:convert';

import 'package:fancardplus/components/topbar.dart';
import 'package:fancardplus/constants.dart';
import 'package:fancardplus/nfc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Transactions extends StatefulWidget {
  const Transactions({Key? key, required this.studentId}) : super(key: key);

  final String studentId;

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  String errorText = '';
  List transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    String studentId = widget.studentId;
    _fetchTransactions(studentId);
    super.initState();
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

  Future<void> _fetchTransactions(String studentId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseApiUrl/transactions/$studentId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
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
        final List responseBody = json.decode(response.body);
        print('Response body in JSON: \n ${response.body}');
        setState(() {
          transactions = responseBody;
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Transactions'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Table(
              columnWidths: {1: FlexColumnWidth(1)},
              border: TableBorder.all(),
              children: transactions.map((item) {
                DateTime parsedDate =
                    DateTime.parse(item['transactionOn'].toString());
                String readableDate =
                    DateFormat('yyyy-MM-dd – kk:mm').format(parsedDate);

                return TableRow(children: [
                  Text(item['transactionId'].toString()),
                  Text(item['facility']['facilityName'].toString()),
                  Text(readableDate),
                ]);
              }).toList(),
            ),
          ),
        ));
  }
}
