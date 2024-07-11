import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_summary.dart';

class SummaryDatum {
  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String selectedAnswer;
  final bool isCorrect;

  SummaryDatum({
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.selectedAnswer,
    required this.isCorrect,
  });
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.restartQuiz, {super.key});
  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<SummaryDatum> getSummaryData() {
    final List<SummaryDatum> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add(SummaryDatum(
          questionIndex: i + 1,
          question: questions[i].text,
          correctAnswer: questions[i].answers[0],
          selectedAnswer: selectedAnswers[i],
          isCorrect: selectedAnswers[i] == questions[i].answers[0]));
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers =
        summaryData.where((data) => data.isCorrect).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ResultsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
