import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/screen/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestartQuiz});

  final void Function() onRestartQuiz;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'chosen_answer': chosenAnswer[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $numCorrectAnswers out of $numberTotalQuestions question correctly',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestartQuiz,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
              icon: const Icon(Icons.replay),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
