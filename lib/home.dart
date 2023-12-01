import 'package:fancardplus/nfc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:barcode_widget/barcode_widget.dart';

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

    // Format the date using the intl package if issuedOn is not null
    String formattedDate = issuedOn != null
        ? DateFormat('yyyy-MM-dd').format(issuedOn)
        : 'N/A'; // Set a default value if issuedOn is null

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          widget.responseBody['imageUrl'] ??
                              'https://randomuser.me/api/portraits/men/73.jpg',
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // First Column
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Name:"),
                              Text("Student ID:"),
                              Text("Issued on:"),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ), // Add spacing between columns

                          // Second Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.responseBody['firstName']} ${widget.responseBody['lastName']}",
                                maxLines: 1,
                              ),
                              Text("${widget.responseBody['userId']}"),
                              Text(formattedDate),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10), // Add spacing
                    Center(
                      child: ClipOval(
                        // Add your image here
                        child: Image.asset(
                          'assets/images/fanshawe_logo.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Barcode
                    Center(
                      child: BarcodeWidget(
                        barcode: Barcode.codabar(),
                        data: widget.responseBody['userId'].toString(),
                        color: Colors.black,
                        height: 50,
                        width: 75,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            final String studentId = widget.responseBody['userId'].toString();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NFCPage(studentId: studentId)),
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
