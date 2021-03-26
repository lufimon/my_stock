part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostFetched extends PostEvent {}
