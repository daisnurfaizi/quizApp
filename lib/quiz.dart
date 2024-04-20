import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/screen/question_screen.dart';
import 'package:quiz/screen/result_screen.dart';
import 'package:quiz/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'StartScreen';
  List<String> selectedAnswers = [];

  void choseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      print(selectedAnswers);
      setState(() {
        activeScreen = 'resultScreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'StartScreen';
      selectedAnswers = [];
    });
  }

  void changeScreen() {
    setState(() {
      activeScreen = 'QuestionsScreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'QuestionsScreen') {
      // question screen
      screenWidget = QuestionScreen(
        onSelectAnswer: choseAnswer,
      );
    }

    if (activeScreen == 'resultScreen') {
      // result screen
      screenWidget = ResultScreen(
          chosenAnswer: selectedAnswers, onRestartQuiz: restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.indigo],
            ),
          ),
          // child: activeScreen == 'StartScreen'
          //     ? StartScreen(changeScreen)
          //     : QuestionsScreen(
          //         onSelectAnswer: choseAnswer,
          //       ),
          child: screenWidget,
        ),
      ),
    );
  }
}
