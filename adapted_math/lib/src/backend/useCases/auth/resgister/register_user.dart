import 'package:adapted_math/src/backend/entitites/accessibility_settings.dart';
import 'package:adapted_math/src/backend/entitites/user.dart';
import 'package:adapted_math/src/backend/repository/user_repository.dart';
import 'package:adapted_math/src/backend/useCases/auth/resgister/get_new_id_user.dart';
import 'package:adapted_math/src/backend/useCases/auth/verify_user.dart';

bool registerUser(String name, String username, String email, String password, AccessibilitySettings accessibilitySettings) {
  if(isUserRegistered(email)){
 User newUser = User(
    id: GetNewUserId.execute(),
    name: name, 
    username: username, 
    email: email, 
    password: password, 
    accessibilitySettings: accessibilitySettings,
  );

  UserRepository().users.add(newUser);
  return UserRepository().users.contains(newUser);
  
  }
  return false;
 
}
