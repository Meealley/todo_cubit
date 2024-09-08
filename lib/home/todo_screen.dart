import 'package:flutter/material.dart';
import 'package:todo_cube/home/widgets/todo_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return const TodoWidget();
  }
}
