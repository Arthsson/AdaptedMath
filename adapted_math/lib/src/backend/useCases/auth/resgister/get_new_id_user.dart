import 'package:adapted_math/src/backend/repository/user_repository.dart';

class GetNewUserId {
  static int execute() {
    int newId = UserRepository().users.length;
    return newId;
  }
}
