import 'package:fancardplus/account.dart';
import 'package:fancardplus/components/bottomnavbar.dart';
import 'package:fancardplus/components/topbar.dart';
import 'package:fancardplus/home.dart';
import 'package:fancardplus/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      // home: const MyHomePage(),
      home: const AppLayout(),
    );
  }
}

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> with TickerProviderStateMixin {
  late final TabController _tabController;

  int _currentIndex = 0;

  // TabController _tabController;

  final List<Widget> _tabList = const [
    AccountPage(),
    MyHomePage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: appBar('Fancard+'),
        body: const TabBarView(
          controller: _tabController,
          children: _tabList,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red[600],
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (currentIndex) {
              setState(() {
                _currentIndex = currentIndex;
              });

              _tabController.animateTo(_currentIndex);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Logs',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }
}
