import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/results_screen.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ));
  }
}

class ResultsSummary extends StatelessWidget {
  const ResultsSummary(this.summaryData, {super.key});
  final List<SummaryDatum> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResultText(
                      color: Colors.white,
                      text: (data.questionIndex).toString(),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResultText(
                            text: data.question,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          ResultText(
                            text: data.selectedAnswer,
                            color: data.isCorrect ? Colors.green : Colors.red,
                          ),
                          if (!data.isCorrect)
                            ResultText(
                              text: data.correctAnswer,
                              color: Colors.green,
                            ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
