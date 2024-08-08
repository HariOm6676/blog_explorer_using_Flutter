import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBlogs extends BlogEvent {}

class ToggleFavoriteStatus extends BlogEvent {
  final String blogId;

  ToggleFavoriteStatus(this.blogId);

  @override
  List<Object> get props => [blogId];
}
