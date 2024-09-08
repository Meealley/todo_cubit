// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todos;

  const TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      TodoModel(id: "1", desc: "I Want to cook my rice"),
      TodoModel(id: "2", desc: "Go to the Gym"),
      TodoModel(id: "3", desc: "Draft Memos for Laptop Purchase"),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<TodoModel>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
