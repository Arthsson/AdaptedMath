import 'package:adapted_math/src/backend/entitites/user.dart';
import 'package:adapted_math/src/backend/useCases/auth/login/get_user.dart';
import 'package:adapted_math/src/backend/useCases/auth/verify_user.dart';

User? loginUser(String email, String password) {
  if(isUserRegistered(email)){
    return getUserByEmailAndPassword(email, password);
  }
  return null;
 
}
