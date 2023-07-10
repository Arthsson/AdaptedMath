import 'package:adapted_math/src/backend/entitites/user.dart';
import 'package:adapted_math/src/backend/repository/user_repository.dart';

User? getUserByEmailAndPassword(String email, String password) {
  return UserRepository().users.firstWhere(
    (user) => user.email == email && user.password == password,
  );
}
