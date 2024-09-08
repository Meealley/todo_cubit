part of 'active_todo_count_cubit.dart';

sealed class ActiveTodoCountState extends Equatable {
  const ActiveTodoCountState();

  @override
  List<Object> get props => [];
}

final class ActiveTodoCountInitial extends ActiveTodoCountState {}
