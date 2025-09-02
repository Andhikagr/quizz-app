class QuizData {
  final String textQuiz;
  final List<String> answerQuiz;

  const QuizData(this.textQuiz, this.answerQuiz);

  List<String> getShuffled() {
    //copy dulu
    final shuffledList = List.of(answerQuiz);
    //copy baru
    shuffledList.shuffle();
    //kembalikan ke list
    return shuffledList;
  }
}
