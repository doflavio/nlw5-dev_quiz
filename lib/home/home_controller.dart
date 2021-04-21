import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/model/awnser_model.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:DevQuiz/shared/model/quiz_model.dart';
import 'package:DevQuiz/shared/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Flávio",
      photoUrl: "https://avatars.githubusercontent.com/u/22053378?v=4",
    );
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          imagem: AppImages.blocks,
          level: Level.facil,
          questionAnsered: 1,
          questions: [
            QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando Flutter"),
              AwnserModel(title: "Muito Top"),
              AwnserModel(title: "Show de bola!", isRight: true),
            ]),
            QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando Flutter"),
              AwnserModel(title: "Muito Top"),
              AwnserModel(title: "Show de bola!", isRight: true),
            ])
          ])
    ];
    state = HomeState.sucess;
  }
}
