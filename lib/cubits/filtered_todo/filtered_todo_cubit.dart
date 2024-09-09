import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cube/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cube/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cube/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_cube/models/filter.dart';
import 'package:todo_cube/models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  final List<TodoModel> initialTodos;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubits;

  FilteredTodoCubit(
      {required this.todoFilterCubit,
      required this.initialTodos,
      required this.todoSearchCubit,
      required this.todoListCubits})
      : super(FilteredTodoState(filtered: initialTodos)) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todoListSubscription =
        todoListCubits.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<TodoModel> filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubits.state.todos
            .where((TodoModel todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubits.state.todos
            .where((TodoModel todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
        filteredTodos = todoListCubits.state.todos;
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((TodoModel todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(filtered: filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
