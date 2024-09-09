import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cube/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cube/models/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;

  late final StreamSubscription todoListSubscription;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print("todoListState : $todoListState");

      final int currentActiveCount = todoListState.todos
          .where((TodoModel todoModel) => !todoModel.completed)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
