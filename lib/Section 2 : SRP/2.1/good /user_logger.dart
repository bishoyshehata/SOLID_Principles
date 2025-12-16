import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_model.dart';

class UserLogger {
  void logUserCreation(UserModel user) {
    print('LOG: User ${user.name} created at ${DateTime.now()}');
  }
}
