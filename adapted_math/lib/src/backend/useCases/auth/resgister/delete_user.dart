import 'package:adapted_math/src/backend/entitites/user.dart';
import 'package:adapted_math/src/backend/repository/user_repository.dart';
import 'package:adapted_math/src/backend/useCases/auth/verify_user.dart';

bool deleteUser(User user) {
  if(isUserRegistered(user.email)){
     UserRepository().users.remove(user);
     return true;
  }
  return false;
 
}
