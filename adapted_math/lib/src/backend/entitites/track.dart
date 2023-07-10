// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adapted_math/src/backend/entitites/level.dart';

class Track {
  String idTrack;
  int scoreUserTrack;
  bool statusTrack;
  double timeTrack;
  int accuracyRateTrack;
  List<Level> levels;

  Track({
    required this.idTrack,
    required this.scoreUserTrack,
    required this.statusTrack,
    required this.timeTrack,
    required this.accuracyRateTrack,
    required this.levels,
  });
}
