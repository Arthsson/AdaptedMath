import 'package:adapted_math/src/backend/entitites/accessibility_settings.dart';
import 'package:adapted_math/src/backend/entitites/track.dart';

import 'mission.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  String password;
  int levelUser;
  int scoreUser;
  List<User> friends;
  List<Mission> missions;
  List<Track> tracksUser;
  AccessibilitySettings accessibilitySettings;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.accessibilitySettings,
    this.tracksUser = const [],
    this.friends = const [],
    this.missions = const [],
    this.levelUser = 1,
    this.scoreUser = 0,
  });
}
