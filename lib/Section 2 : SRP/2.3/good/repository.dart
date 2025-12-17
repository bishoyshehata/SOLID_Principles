import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';

class UserRepository {
  List<UserModel> _users = [];

  void saveToFile() {
    print('Saving ${_users.length} users to file...');
  }

  UserModel? getUserById(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  // Job 7: Statistics
  int getTotalUsers() => _users.length;
}
