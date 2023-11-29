import 'package:fancardplus/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FanCard+',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: '/login', // Set the initial route to the login page
      routes: {
      '/login': (context) => const LoginPage('user@example.com', 'password', key: null),
        // Add other routes if needed
      },
     /* home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
            appBar: appBar('Fancard+'),
            body: const TabBarView(
              children: [AccountPage(), MyHomePage(), ProfilePage()],
            ),
            bottomNavigationBar: const TabBar(
              indicatorColor: Colors.transparent,
              splashBorderRadius: BorderRadius.all(Radius.circular(100)),
              tabs: [
                Tab(icon: Icon(Icons.account_balance), text: "Account"),
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.person), text: "Profile"),
              ],
            )),
      ),*/
    );
  }
}
