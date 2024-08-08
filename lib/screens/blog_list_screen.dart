import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blog_bloc.dart';
import '../blocs/blog_state.dart';
import '../blocs/search/search_bloc.dart';
import '../blocs/search/search_event.dart';
import '../blocs/search/search_state.dart';
import '../repositories/blog_repository.dart';
import 'blog_detail_screen.dart';

class BlogListScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blogs and Articles',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BlogSearchDelegate(),
              );
            },
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text: 'ALL'),
            Tab(text: 'MERCHANTS'),
            Tab(text: 'BUSINESS'),
            Tab(text: 'TUTORIAL'),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlogLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailScreen(blog: blog),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          blog.imageUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            blog.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is BlogError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No blogs available.'));
        },
      ),
    );
  }
}

class BlogSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBloc(BlogRepository())..add(SearchBlogs(query)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailScreen(blog: blog),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          blog.imageUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            blog.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No blogs available.'));
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
