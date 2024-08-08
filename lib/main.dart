import 'package:blog_explorer/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'blocs/blog_bloc.dart';
import 'blocs/blog_event.dart';
import 'blocs/search/search_bloc.dart';
import 'repositories/blog_repository.dart';
import 'screens/blog_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Open a box for blogs
  await Hive.openBox<Blog>('blogs');

  final blogRepository = BlogRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlogBloc(blogRepository)..add(FetchBlogs()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(blogRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18), // Replaces bodyText1
          bodyMedium: TextStyle(fontSize: 16), // Replaces bodyText2
        ),
      ),
      home: BlogListScreen(),
    );
  }
}
