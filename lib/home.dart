import 'package:fancardplus/nfc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> responseBody;

  const MyHomePage({Key? key, required this.responseBody}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Parse the date string
   DateTime? issuedOn = widget.responseBody['issuedOn'] != null
        ? DateTime.parse(widget.responseBody['issuedOn'])
        : null;

    // Format the date using intl package if issuedOn is not null
    String formattedDate = issuedOn != null
        ? DateFormat('yyyy-MM-dd').format(issuedOn)
        : 'N/A'; // Set a default value if issuedOn is null
    
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      widget.responseBody[
                              'https://randomuser.me/api/portraits/men/73.jpg'] ??
                          'https://randomuser.me/api/portraits/men/73.jpg',
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 250,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Column
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name:"),
                              Text("Student ID:"),
                              Text("Issued on:"),
                            ],
                          ),
                          const SizedBox(
                              width: 10), // Add spacing between columns

                          // Second Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "${widget.responseBody['firstName']} ${widget.responseBody['lastName']}",
                                  maxLines: 1),
                              Text("${widget.responseBody['userId']}"),
                              Text(formattedDate),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NFCPage()),
            );
          },
          tooltip: 'NFC',
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.nfc_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
