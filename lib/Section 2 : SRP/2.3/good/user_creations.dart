import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/id_generator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/notifications.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/repository.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/search.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_logger.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_validation.dart';

class UserCreations {
  IdGenerator _idGenerator;
  UserValidation _userValidation;
  UserRepository _repository;
  UserNotification _notifications;
  UserLogger _userLogger;
  Search _search = Search();
  UserCreations(
    this._idGenerator,
    this._userValidation,
    this._repository,
    this._notifications,
    this._userLogger,
    this._search,
  );

  List<UserModel> _users = [];
  UserModel createUser(
    String firstName,
    String lastName,
    String email,
    List<String> roles,
  ) {
    // Job 1: Generate ID
    final id = _idGenerator.generateId();

    // Job 2: Validate
    if (!_userValidation.isValidName(firstName) ||
        !_userValidation.isValidName(lastName) ||
        !_userValidation.isValidEmail(email)) {
      throw Exception('Invalid user data');
    }

    // Create user
    final user = UserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      roles: roles,
    );

    // Job 3: Save
    _users.add(user);
    _repository.saveToFile();

    // Job 5: Send email
    _notifications.sendWelcomeEmail(user);

    // Job 6: Log
    _userLogger.logUserCreation(user);

    print('Found ${_search.searchUsers(user.firstName).length} users');

    print('📊 Total users: ${_repository.getTotalUsers()}');
    // print('📊 Role stats: ${manager.getRoleStatistics()}');

    return user;
  }
}
