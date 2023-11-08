import 'package:flutter/material.dart';

BottomNavigationBar bottomBar() {
  return BottomNavigationBar(
      backgroundColor: Colors.red[600],
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      onTap: (value) {},
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Logs',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]);
}
