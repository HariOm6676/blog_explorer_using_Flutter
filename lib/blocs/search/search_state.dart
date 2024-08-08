import 'package:equatable/equatable.dart';

import '../../models/blog_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Blog> blogs;

  SearchLoaded(this.blogs);

  @override
  List<Object> get props => [blogs];
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}
