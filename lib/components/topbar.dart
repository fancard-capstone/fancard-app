import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String text) {
  return AppBar(
      backgroundColor: Colors.red[600],
      title: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)));
}
