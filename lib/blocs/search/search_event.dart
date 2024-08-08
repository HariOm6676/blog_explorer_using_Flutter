import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchBlogs extends SearchEvent {
  final String query;

  SearchBlogs(this.query);

  @override
  List<Object> get props => [query];
}
