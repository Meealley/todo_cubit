import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_cube/utils/app_textstyle.dart';
import 'package:todo_cube/utils/appcolors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  final TextEditingController textEditingControlle;
  const CustomTextField({
    super.key,
    required this.textEditingControlle,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: textEditingControlle,
        style: AppTextStyles.bodySmall,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: AppTextStyles.bodyText,
          contentPadding: const EdgeInsets.only(
            top: 1,
            bottom: 0,
            left: 6,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            borderSide: BorderSide(
              color: AppColors.backgroundDark,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
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
