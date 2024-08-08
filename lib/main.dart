import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blog_bloc.dart';
import 'blocs/blog_event.dart';
import 'blocs/search/search_bloc.dart';
import 'repositories/blog_repository.dart';
import 'screens/blog_list_screen.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: BlogListScreen(),
      ),
    );
  }
}
