import 'package:flutter/material.dart';
import 'package:todo_cube/app_router.dart';
import 'package:todo_cube/cubits/cubits.dart';
import 'package:todo_cube/home/todo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<FilteredTodoCubit>(
          create: (context) => FilteredTodoCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
            todoFilterCubit: context.read<TodoFilterCubit>(),
            todoSearchCubit: context.read<TodoSearchCubit>(),
            todoListCubits: context.read<TodoListCubit>(),
          ),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
            todoListCubit: context.read<TodoListCubit>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Todo App",
        routerConfig: goRouter,
      ),
    );
  }
}
