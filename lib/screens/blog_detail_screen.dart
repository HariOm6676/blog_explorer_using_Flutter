import 'package:flutter/material.dart';

import '../models/blog_model.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(blog.imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              blog.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
