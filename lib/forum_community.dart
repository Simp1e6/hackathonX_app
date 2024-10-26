import 'package:flutter/material.dart';
import 'add_forum.dart';

class ForumCommunity extends StatefulWidget {
  final String title;

  const ForumCommunity({super.key, required this.title});

  @override
  State<ForumCommunity> createState() => _ForumCommunityState();
}

class _ForumCommunityState extends State<ForumCommunity> {
  final List<bool> _likedPosts = List.generate(5, (index) => false); // List to track liked state

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
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ${index + 1}', // Placeholder for user name
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Use a random image from a placeholder API
                        Container(
                          height: 200, // Placeholder height for post image
                          color: Colors.grey[300], // Placeholder for image
                          alignment: Alignment.center,
                          child: const Text('Image', style: TextStyle(color: Colors.black54)),
                        ),
                        const SizedBox(height: 5),
                        Text('This is a caption for post ${index + 1}.'),
                        const SizedBox(height: 10),
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
                              icon: const Icon(Icons.comment),
                              onPressed: () {
                                // Add comment functionality here
                                print('Commented on post ${index + 1}');
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
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
        heroTag: "AddForumButton",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPostPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
