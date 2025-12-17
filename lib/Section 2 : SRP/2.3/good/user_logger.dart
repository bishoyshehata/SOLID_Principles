import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';

class UserLogger {
  // Job 6: Logging
  void logUserCreation(UserModel user) {
    final timestamp = DateTime.now();
    print('📝 LOG [$timestamp]: User created - ${user.id} (${user.email})');
  }
}
