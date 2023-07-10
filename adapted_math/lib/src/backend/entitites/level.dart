// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adapted_math/src/backend/entitites/question.dart';

class Level {
  String idLevel;
  int scoreUser;
  bool statusLevel;
  double time;
  int accuracyRate;
  List<Question> questions;

  Level({
    required this.idLevel,
    required this.scoreUser,
    required this.statusLevel,
    required this.time,
    required this.accuracyRate,
    required this.questions,
  });
}
