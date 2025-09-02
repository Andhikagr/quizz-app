import 'package:flutter/material.dart';
import 'package:quizz_app/quiz_model/finish_page.dart';
import 'package:quizz_app/quiz_model/question.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //simpan jawaban
  final List<String> selectedAnswer = [];
  int currentIndexQuiz = 0;
  bool isFinish = false;
  int isSelected = -1;

  void quizPage() {
    setState(() {
      if (currentIndexQuiz < question.length - 1) {
        currentIndexQuiz++;
        shuffledAnswer = question[currentIndexQuiz].getShuffled();
        isSelected = -1;
      }
      isFinish = currentIndexQuiz == question.length - 1;
    });
  }

  List<String> shuffledAnswer = [];

  //memilih jawaban
  void chooseAnswer(String answer) {
    if (selectedAnswer.length > currentIndexQuiz) {
      selectedAnswer[currentIndexQuiz] = answer;
    } else {
      selectedAnswer.add(answer);
    }
  }

  @override
  void initState() {
    super.initState();
    shuffledAnswer = question[currentIndexQuiz].getShuffled();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentIndexQuiz];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.quiz_outlined),
        title: Text(
          "Flutter Quiz",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question ${currentIndexQuiz + 1} of ${question.length}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                currentQuestion.textQuiz,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 20),
                  itemCount: shuffledAnswer.length,
                  itemBuilder: (context, index) {
                    final answer = shuffledAnswer[index];
                    final bool selectAnswer = isSelected == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                          chooseAnswer(answer);
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectAnswer
                              ? Colors.amberAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: ListTile(
                          title: Text(
                            answer,
                            style: TextStyle(
                              color: selectAnswer ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (isSelected != -1)
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        if (isFinish) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  FinishPage(chosenAnswer: selectedAnswer),
                            ),
                          );
                        } else {
                          quizPage();
                        }
                      },
                      child: Ink(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amberAccent,
                        ),
                        child: Center(
                          child: Text(
                            isFinish ? "Selesai" : "Next",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
