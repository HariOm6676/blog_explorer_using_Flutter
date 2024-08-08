import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../models/blog_model.dart';
import '../repositories/blog_repository.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc(this.blogRepository) : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await blogRepository.fetchBlogs();
        emit(BlogLoaded(blogs));
      } catch (e) {
        emit(BlogError("Failed to fetch blogs"));
      }
    });

    on<ToggleFavoriteStatus>((event, emit) {
      if (state is BlogLoaded) {
        final List<Blog> updatedBlogs = (state as BlogLoaded).blogs.map((blog) {
          if (blog.id == event.blogId) {
            blog.isFavorite = !blog.isFavorite;
          }
          return blog;
        }).toList();
        emit(BlogLoaded(updatedBlogs));

        // Save updated blogs to Hive
        final box = Hive.box<Blog>('blogs');
        box.clear();
        box.addAll(updatedBlogs);
      }
    });
  }
}
