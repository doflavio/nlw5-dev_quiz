import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final bool isSelected;
  final AwnserModel awnser;
  final bool disabled;
  //final VoidCallback onTap;
  final ValueChanged<bool> onTap;

  const AwnserWidget({
    Key? key,
    this.isSelected = false,
    required this.awnser,
    this.disabled = false,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColorRight =>
      awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight =>
      awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  TextStyle get _selectedTextStyledRight =>
      awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          //onTap: onTap,
          onTap: () {
            onTap(awnser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    awnser.title,
                    style: isSelected
                        ? _selectedTextStyledRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                        (BorderSide(
                            color: isSelected
                                ? _selectedBorderRight
                                : AppColors.border)),
                      )),
                  width: 24,
                  height: 24,
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
