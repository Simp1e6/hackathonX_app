import 'package:flutter/material.dart';
// import 'forum_community.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://freesvg.org/img/abstract-user-flat-4.png'),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'ABC',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 195),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                    child: const Text('Post !'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Leave your comment here ...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.photo),
                label: const Text('Upload your photo'),
              ),
              const SizedBox(height: 16),
              
            ],
          ),
        ),
      ),
    );
  }
}
