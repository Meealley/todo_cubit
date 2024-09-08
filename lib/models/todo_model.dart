// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_cube/constants/constants.dart';

class TodoModel extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  TodoModel({String? id, required this.desc, this.completed = false})
      : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, completed];

  @override
  bool get stringify => true;
}
