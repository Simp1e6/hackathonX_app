import 'package:flutter/material.dart';

class ForumCommunity extends StatefulWidget {
  final String title;

  const ForumCommunity({super.key, required this.title});

  @override
  _ForumCommunityState createState() => _ForumCommunityState();
}

class _ForumCommunityState extends State<ForumCommunity> {
  List<bool> _likedPosts = List.generate(5, (index) => false); // List to track liked state

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: _likedPosts.length, // Use the length of likedPosts
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ${index + 1}', // Placeholder for user name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Use a random image from a placeholder API
                        Container(
                          height: 200, // Placeholder height for post image
                          color: Colors.grey[300], // Placeholder for image
                          alignment: Alignment.center,
                          child: Text('Image', style: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(height: 5),
                        Text('This is a caption for post ${index + 1}.'),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                _likedPosts[index] ? Icons.favorite : Icons.favorite_outline,
                                color: _likedPosts[index] ? Colors.red : null, // Change color based on state
                              ),
                              onPressed: () {
                                setState(() {
                                  _likedPosts[index] = !_likedPosts[index]; // Toggle liked state
                                });
                                print(_likedPosts[index] ? 'Liked post ${index + 1}' : 'Unliked post ${index + 1}');
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                // Add comment functionality here
                                print('Commented on post ${index + 1}');
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                // Add share functionality here
                                print('Shared post ${index + 1}');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Allows the sheet to take up more space
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Container(
                  height: 300, // Set height for the modal sheet
                  child: Center(child: Text("Add a new post")),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
