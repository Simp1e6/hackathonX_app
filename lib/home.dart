//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonX_app/constant/string.dart';
import 'package:hackathonX_app/identitySelection.dart';
import 'package:hackathonX_app/second_map.dart';
import 'map.dart'; // Import your map page file
import 'forum_community.dart'; // Import your forum community page file
import 'profile.dart'; // Import your profile page file
import 'identitySelection.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of widget pages to show
  static final List<Widget> _pages = <Widget>[
    const HomePage(), // Custom HomePage widget
    IdentitySelectionPage(onDonateFoodPressed: () {  }, onFindFoodPressed: () {  }),
    const Map(title: 'Map'),
    const ForumCommunity(title: 'Forum Community'),
    const Profile(title: 'Profile Page'),
    // const Map(title: 'Map'),
  ];

  // This method is triggered when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index to change pages
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const HomePage(), // Custom HomePage widget
      IdentitySelectionPage(
        onDonateFoodPressed: () {
          _onItemTapped(4); // Set the index to the Map page (index 2)
        },
        onFindFoodPressed: () {
          _onItemTapped(5); // Set the index to the Map page (index 2)
        },
      ),
      const ForumCommunity(title: 'Forum Community'),
      const Profile(title: 'Profile Page'),
      const Map(title: 'Map'),
      const SecondMap(title: 'SecondMap'),

    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(kHomeTitle),
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
        children: pages, // Display the respective page based on selected index
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex == 4 || _selectedIndex == 5 ? 1 : _selectedIndex, // This will manage the selected tab
        onTap: _onItemTapped, // This handles the tap on items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
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
          // BottomNavigationBarItem(
          //   icon: SizedBox.shrink(),
          //   label: '',
          // ),
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
    return Scaffold(
      backgroundColor: Colors.yellow[50], // Background color matching your image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting and Name
            const Text(
              'Hi, ABC',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Claims and Rewards Section
            Row(
              children: [
                // Claims Box
                SizedBox(
                  height: 135,
                  width: 183  , // Adjust the width to match the rewards box
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant, size: 40, color: Colors.black54),
                        SizedBox(height: 10),
                        Text(
                          '3 Claims',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Rewards Box
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Row(
                        children: [
                          Icon(Icons.wallet_giftcard, size: 40, color: Colors.black54),
                          SizedBox(width: 10), // Add spacing between the icon and text
                          Text(
                            'Rewards',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                        Divider(thickness: 2, color: Colors.black54),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '2',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Vouchers'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '20',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Points'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Box
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What do you need to know?',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

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
                        Image.asset(
                          'assets/newsIcon.png', // Replace with your image URL
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

