// ignore_for_file: camel_case_types

import 'package:fancardplus/components/topbar.dart';
import 'package:flutter/material.dart'
    show BuildContext, Colors, Column, CrossAxisAlignment, DropdownButton, DropdownMenuItem, EdgeInsets, GestureDetector, ListTile, ListView, Scaffold, SizedBox, Switch, Text, TextDecoration, TextStyle, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class appSetting extends StatefulWidget {
  const appSetting({super.key});

  @override
  State<appSetting> createState() => _appSettingState();
}

class _appSettingState extends State<appSetting> {
  bool toggleSetting = false;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('App Setting'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Notification'),
            trailing: DropdownButton<bool>(
              value: toggleSetting,
              onChanged: (value) {
                setState(() {
                  toggleSetting = value!;
                });
              },
              items: const [
                DropdownMenuItem<bool>(
                  value: true,
                  child: Text('Yes'),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: Text('No'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Service Agreement'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to Terms of Use page
                   
                  },
                  child: const Text(
                    'Terms of Use',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to Privacy Policy page
                   
                  },
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}