import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String title;

  const Profile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/profile.png',
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        //print('Edit is pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Edit'),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50),
                          ListTile(
                            leading: Icon(Icons.person, color: Color.fromARGB(255, 214, 174, 88)),
                            title: Text('ABC'),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.phone, color: Color.fromARGB(255, 214, 174, 88)),
                            title: Text('012-3456789'),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.email, color: Color.fromARGB(255, 214, 174, 88)),
                            title: Text('abc123@gmail.com'),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.other_houses_rounded, color: Color.fromARGB(255, 214, 174, 88)),
                            title: Text('123, Jalan Universiti, Taman Universiti, Malaysia, Bumi'),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.lock, color: Color.fromARGB(255, 214, 174, 88)),
                            title: Text('********'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        backgroundColor: const Color.fromARGB(255, 238, 208, 118),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Log out'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

