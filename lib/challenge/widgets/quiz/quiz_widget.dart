import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/awnser_model.dart';
import 'package:DevQuiz/shared/model/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  //final VoidCallback onChange;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    //required this.onChange,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then(
                    //(value) => widget.onChange(),
                    (_) => widget.onSelected(value));
              },
            )

          /*
          ...widget.question.awnsers
              .map((q) => AwnserWidget(
                    isSelected: q.isRight,
                    title: q.title,
                  ))
              .toList(),
              */
        ],
      ),
    );
  }
}
