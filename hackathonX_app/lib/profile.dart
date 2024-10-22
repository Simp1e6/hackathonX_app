import 'package:flutter/material.dart';

class Profile extends StatelessWidget {  // Renamed 'profile' to 'Profile'
  final String title;

  const Profile({super.key, required this.title});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),  // Optional: Added AppBar to display the title
      ),
      body: Center(
        child: Image.network(
            'https://freesvg.org/img/abstract-user-flat-4.png',
            width: 150,
            height: 150,
      ),
      
    ),
    );
  }
}

