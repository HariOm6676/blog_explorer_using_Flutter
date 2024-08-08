import 'package:flutter_bloc/flutter_bloc.dart';

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
  }
}
