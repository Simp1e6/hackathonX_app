import 'package:flutter/material.dart';
import 'secondPage.dart'; // Import your second page file here
//import 'profilePage.dart'; // Import your profile page file here
//import 'settingsPage.dart'; // Import your settings page file here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hungry Saver'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of widget pages to show
  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    secondPage(title: 'Search Page'),  // Your custom second page
    //ProfilePage(title: 'Profile Page'), // Your custom profile page
    //SettingsPage(title: 'Settings Page'), // Your custom settings page
  ];

  // This method is triggered when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index to change pages
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Display the respective page based on selected index
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // This will manage the selected tab
        onTap: _onItemTapped, // This handles the tap on items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue, // Change color for the selected item
        unselectedItemColor: Colors.grey, // Color for the unselected items
      ),
    );
  }
}
