import 'package:flutter/material.dart';
import 'package:hackathonX_app/home.dart';
import 'map.dart';

class IdentitySelectionPage extends StatelessWidget {
 final VoidCallback onDonateFoodPressed;
 final VoidCallback onFindFoodPressed;
  const IdentitySelectionPage({super.key, required this.onDonateFoodPressed, required this.onFindFoodPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*const Text(
              'What action you want to take?',
              style: TextStyle(fontSize: 24), // Adjust the font size as needed
            ),
            const SizedBox(height: 20),*/
            SizedBox(
              width: 300,
              height: 100,
              child: ElevatedButton.icon(
                onPressed: onDonateFoodPressed, // Use the passed function here
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                    Icons.food_bank,
                    size: 40,
                ),
                label: const Text(
                  'Donate Food',
                  style: TextStyle(fontSize: 30), // Adjust the font size as needed
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 100,
              child: ElevatedButton.icon(
                onPressed: onFindFoodPressed, // Use the passed function here
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.search,
                  size: 40,),
                label: const Text(
                  'Search Food',
                  style: TextStyle(fontSize: 30), // Adjust the font size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  final String identity;

  const MapPage({super.key, required this.identity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Page - $identity')),
      body: Center(
        child: Text('Displaying map for $identity'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: IdentitySelectionPage(onDonateFoodPressed: () {  }, onFindFoodPressed: () { },),
  ));
}
