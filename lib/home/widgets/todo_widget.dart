import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_cube/common/button.dart';
import 'package:todo_cube/common/custom_textfield.dart';
import 'package:todo_cube/common/search_field.dart';
import 'package:todo_cube/cubits/cubits.dart';
import 'package:todo_cube/models/filter.dart';
import 'package:todo_cube/utils/app_textstyle.dart';
import 'package:todo_cube/utils/appcolors.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController searchEditingController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo Home Page",
          style: AppTextStyles.bodyText,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Get ahead of your peers with 📝",
                        style: AppTextStyles.bodyText,
                      ),
                      Text(
                        "${state.activeTodoCount} items left",
                        style: AppTextStyles.bodyItems,
                      )
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                textEditingControlle: textEditingController,
                labelText: "What task do you have for today?",
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonPress(
                text: "Add tasks",
                onPressed: () {
                  final String todoDesc = textEditingController.text;
                  if (todoDesc.trim().isNotEmpty) {
                    context.read<TodoListCubit>().addTodo(todoDesc);
                    textEditingController.clear();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SearchField(
                textEditingControlle: searchEditingController,
                onChange: (String? searchTerm) {
                  if (searchTerm != null) {
                    context.read<TodoSearchCubit>().setSearchTerm(searchTerm);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                labelStyle: AppTextStyles.bodySmall,
                controller: _tabController,
                onTap: (index) {
                  if (index == 0) {
                    context.read<TodoFilterCubit>().changeFilter(Filter.active);
                  } else if (index == 1) {
                    context.read<TodoFilterCubit>().changeFilter(Filter.all);
                  } else if (index == 2) {
                    context
                        .read<TodoFilterCubit>()
                        .changeFilter(Filter.completed);
                  }
                },
                tabs: const [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(text: 'All'),
                  Tab(text: 'Completed'),
                ],
              ),
              SizedBox(
                height: 400,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    ActiveTab(),
                    ActiveTab(),
                    ActiveTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveTab extends StatefulWidget {
  const ActiveTab({
    super.key,
  });

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    // final Filter filter;

    final todos = context.watch<FilteredTodoCubit>().state.filtered;

    late final TextEditingController editingController =
        TextEditingController();

    // Check if todos list is empty before returning the ListView
    if (todos.isEmpty) {
      return Center(
        child: Text(
          "No tasks yet. Add a few to get started!",
          style: AppTextStyles.bodySmall,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: todos.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(todos[index].id),
          onDismissed: (_) {
            context.read<TodoListCubit>().removeTodo(todos[index]);
          },
          child: ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    bool error = false;
                    editingController.text = todos[index].desc;

                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        title: Text(
                          "Edit Task ",
                          style: AppTextStyles.bodyText,
                        ),
                        content: CustomTextField(
                          textEditingControlle: editingController,
                          labelText: "Edit your current task",
                        ),
                        actions: [
                          ButtonPress(
                            text: "Cancel",
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonPress(
                            text: "Edit",
                            onPressed: () {
                              setState(() {
                                if (editingController.text.isNotEmpty) {
                                  context.read<TodoListCubit>().editTodo(
                                        todos[index].id,
                                        editingController.text,
                                      );
                                  context.pop();
                                }
                              });
                            },
                          )
                        ],
                      );
                    });
                  });
            },
            leading: Checkbox(
              value: todos[index].completed,
              onChanged: (bool? checked) {
                context.read<TodoListCubit>().toggleTodo(todos[index].id);
              },
            ),
            title: Text(
              todos[index].desc,
              style: AppTextStyles.bodySmall,
            ),
          ),
        );
      },
    );
  }
}
