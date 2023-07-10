import 'package:adapted_math/src/backend/repository/user_repository.dart';

bool isUserRegistered(String email) {
  return UserRepository().users.any((user) => user.email == email);
}
