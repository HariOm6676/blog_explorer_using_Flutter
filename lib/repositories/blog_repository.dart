import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/blog_model.dart';

class BlogRepository {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-hasura-admin-secret': adminSecret,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List<dynamic> blogsJson = jsonResponse['blogs'];

      // Save blogs to Hive
      final box = Hive.box<Blog>('blogs');
      final blogs = blogsJson.map((json) => Blog.fromJson(json)).toList();
      box.clear();
      box.addAll(blogs);

      return blogs;
    } else {
      // Load blogs from Hive if network request fails
      final box = Hive.box<Blog>('blogs');
      if (box.isNotEmpty) {
        return box.values.toList();
      }
      throw Exception('Failed to load blogs');
    }
  }
}
