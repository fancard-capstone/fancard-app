import 'package:fancardplus/account.dart';
import 'package:fancardplus/components/topbar.dart';
import 'package:fancardplus/home.dart';
import 'package:fancardplus/profile.dart';
import 'package:flutter/material.dart';

class SuccessLanding extends StatelessWidget {
  final Map<String, dynamic> responseBody;

  const SuccessLanding({Key? key, required this.responseBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FanCard+',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: appBar('Fancard+'),
          body: TabBarView(
            children: [
              AccountPage(responseBody: responseBody),
              MyHomePage(responseBody: responseBody),
              ProfilePage(responseBody: responseBody),
            ],
          ),
          bottomNavigationBar: const TabBar(
            indicatorColor: Colors.transparent,
            splashBorderRadius: BorderRadius.all(Radius.circular(100)),
            tabs: [
              Tab(icon: Icon(Icons.account_balance), text: "Account"),
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
