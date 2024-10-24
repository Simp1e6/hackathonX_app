import 'package:flutter/material.dart';
import 'forum_community.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://freesvg.org/img/abstract-user-flat-4.png'),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'ABC',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 200,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                    child: Text('Post !'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Leave your comment here ...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.photo),
                label: Text('Upload your photo'),
              ),
              SizedBox(height: 16),
              
            ],
          ),
        ),
      ),
    );
  }
}
