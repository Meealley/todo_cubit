import 'package:flutter/material.dart';
import 'package:todo_cube/common/button.dart';
import 'package:todo_cube/common/custom_textfield.dart';
import 'package:todo_cube/common/search_field.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home Page",
                    style: AppTextStyles.bodyText,
                  ),
                  Text(
                    "10 items left",
                    style: AppTextStyles.bodyItems,
                  )
                ],
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
              const ButtonPress(
                text: "Add tasks",
              ),
              const SizedBox(
                height: 20,
              ),
              SearchField(
                textEditingControlle: searchEditingController,
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
    return ListView(children: [
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Flutter App development",
          style: AppTextStyles.bodySmall,
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.check_box,
          color: AppColors.primary,
        ),
        title: Text(
          "I want to Learn Dart development",
          style: AppTextStyles.bodySmall,
        ),
      ),
    ]);
  }
}
