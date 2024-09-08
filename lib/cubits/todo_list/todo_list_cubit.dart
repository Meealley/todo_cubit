import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cube/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = TodoModel(desc: todoDesc);
    final newTodos = [...state.todos, newTodo];
    final newState = state.copyWith(todos: newTodos);
    emit(newState);
    print(newState);
  }

  void editTodo(String id, String todoDesc) {
    final newTodos = state.todos.map((TodoModel todo) {
      if (todo.id == id) {
        return TodoModel(
          id: id,
          desc: todoDesc,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();
    final newState = state.copyWith(todos: newTodos);
    emit(newState);
    print(newState);
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((TodoModel todo) {
      if (todo.id == id) {
        return TodoModel(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();
    final newState = state.copyWith(todos: newTodos);
    emit(newState);
    print(newState);
  }

  void removeTodo(TodoModel todo) {
    final newTodos =
        state.todos.where((TodoModel td) => td.id != todo.id).toList();

    final newState = state.copyWith(todos: newTodos);
    emit(newState);
    print(newState);
  }
}
