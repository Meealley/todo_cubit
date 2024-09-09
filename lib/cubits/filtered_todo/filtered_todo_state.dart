// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

part of 'filtered_todo_cubit.dart';

class FilteredTodoState extends Equatable {
  final List<TodoModel> filtered;

  const FilteredTodoState({required this.filtered});

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(
      filtered: [],
    );
  }

  @override
  List<Object> get props => [filtered];

  @override
  bool get stringify => true;

  FilteredTodoState copyWith({
    List<TodoModel>? filtered,
  }) {
    return FilteredTodoState(
      filtered: filtered ?? this.filtered,
    );
  }
}
