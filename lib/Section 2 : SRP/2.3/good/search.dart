import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';

class Search {
  List<UserModel> _users = [];
  List<UserModel> searchUsers(String term) {
    return _users
        .where(
          (user) => user.firstName.contains(term) || user.email.contains(term),
        )
        .toList();
  }
}
