import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, {super.key});
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'questionIndex': i + 1,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'selectedAnswer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30),
            ResultsSummary(getSummaryData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
