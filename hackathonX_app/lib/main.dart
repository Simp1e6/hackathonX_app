import 'package:flutter/material.dart';
import 'register.dart'; // Import your register page
import 'login.dart'; // Import login page
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
    HomePage(), // Custom HomePage widget
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle setting button press
            },
          ),
        ],
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

// Custom Home Page Widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding to keep button away from the sides
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                backgroundColor: const Color.fromARGB(255, 243, 205, 92),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 70),
              ),
              onPressed: () {
                // Handle button press
                print('Button Pressed!');
                // Add any functionality you want for this button
              },
              child: Row(
                children: [
                  const Icon(Icons.star, size: 50),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      'Hungry Point: 100',
                      style: const TextStyle(fontSize: 30, overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Announcement', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 10),
            // Scrollable list of rectangle-shaped containers
            Expanded(
              child: ListView(
                children: List.generate(8, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5), // Spacing between rectangles
                    padding: const EdgeInsets.all(20), // Padding inside the rectangle
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 205, 92), // Background color of the rectangle
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Row( // Using Row to place image beside text
                      children: [
                        // Image widget beside the description
                        Image.network(
                          'https://via.placeholder.com/50', // Replace with your image URL
                          width: 50, // Set the width of the image
                          height: 50, // Set the height of the image
                          fit: BoxFit.cover, // Maintain aspect ratio
                        ),
                        const SizedBox(width: 10), // Space between image and text
                        Expanded( // Make sure text takes remaining space
                          child: Text(
                            'Announcement ${index + 1}: This is a description of the announcement content here.',
                            style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

