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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
