import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        "Home Page",
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

class ActiveTab extends StatelessWidget {
  const ActiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final Filter filter;

    final todos = context.watch<FilteredTodoCubit>().state.filtered;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: todos.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.check_box,
            color: AppColors.primary,
          ),
          title: Text(
            todos[index].desc,
            style: AppTextStyles.bodySmall,
          ),
        );
      },
    );
  }
}
