import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/blog_repository.dart'; // Adjust the path
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BlogRepository blogRepository;

  SearchBloc(this.blogRepository) : super(SearchInitial()) {
    on<SearchBlogs>((event, emit) async {
      emit(SearchLoading());
      try {
        final blogs = await blogRepository.fetchBlogs();
        final filteredBlogs = blogs
            .where((blog) =>
                blog.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(SearchLoaded(filteredBlogs));
      } catch (e) {
        emit(SearchError("Failed to search blogs"));
      }
    });
  }
}
