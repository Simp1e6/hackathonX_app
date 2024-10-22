import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  final String title;

  const Map({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
