class Question {
  String idQuestion;
  String text;
  List<String> options;
  int correctOptionIndex;
  double timeQuestion;
  bool statusQuestion;
  bool isBonusQuestion;
  bool isCorrectly;

  Question({
    required this.idQuestion,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.timeQuestion,
    this.statusQuestion = false,
    required this.isBonusQuestion,
    required this.isCorrectly
  });
}
