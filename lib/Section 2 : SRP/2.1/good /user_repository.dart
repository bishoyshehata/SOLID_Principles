import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_model.dart';

class UserRepository {
  void saveToDatabase(UserModel user) {
    print('Saving user ${user.name} to database...');
  }
}
