import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_cube/utils/app_textstyle.dart';
import 'package:todo_cube/utils/appcolors.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingControlle;
  final void Function(String)? onChange;
  const SearchField({
    super.key,
    required this.textEditingControlle,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: onChange,
        controller: textEditingControlle,
        style: AppTextStyles.bodySmall,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          contentPadding: EdgeInsets.only(
            top: 1,
            bottom: 0,
            left: 6,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
              color: AppColors.backgroundDark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
              color: AppColors.backgroundDark,
            ),
          ),
        ),
      ),
    );
  }
}
