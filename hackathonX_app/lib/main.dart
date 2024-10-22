import 'package:flutter/material.dart';
import 'register.dart'; // Import your register page
import 'login.dart'; //Import login page
import 'map.dart'; // Import your map page file
import 'forumCommunity.dart'; // Import your forum community page file
import 'profile.dart'; // Import your profile page file
import 'forget_password.dart'; // Import forget password page file

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 215, 179, 102)),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Start with the login page
      routes: {
        '/login': (context) => const LoginPage(), // Login Page
        '/register': (context) => const RegisterPage(), // Register Page
        '/forget_password': (context) => const ForgetPasswordPage(), // Forget Password Page
        '/home': (context) => const MyHomePage(title: 'Hungry Saver'), // Home Page after login
      },
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
    Map(title: 'Map'),
    ForumCommunity(title: 'Forum Community'),
    Profile(title: 'Profile Page'),
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
            icon: Icon(Icons.map_sharp),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Change color for the selected item
        unselectedItemColor: Colors.grey, // Color for the unselected items
      ),
    );
  }
}
