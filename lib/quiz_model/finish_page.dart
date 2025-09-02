import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizz_app/homepage.dart';
import 'package:quizz_app/quiz_model/question.dart';

class FinishPage extends StatelessWidget {
  final List<String> chosenAnswer;
  const FinishPage({super.key, required this.chosenAnswer});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].textQuiz,
        'correct_answer': question[i].answerQuiz[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = summaryData.length;
    final correctAnswer = summaryData
        .where((data) => data["user_answer"] == data["correct_answer"])
        .length;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/tropi.png'),
              Text(
                "You answered $correctAnswer out of $totalQuestion questions correctly",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.restart_alt),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                label: Text("Restart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
