import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_validation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/hash_password.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_logger.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_repository.dart';

class UserCreation {
  UserLogger _userLogger;
  UserRepository _userRepository;
  HashPassword _hashPassword;
  EmailValidation _emailValidation;
  EmailService _emailService;

  UserCreation(
    this._userLogger,
    this._userRepository,
    this._hashPassword,
    this._emailValidation,
    this._emailService,
  );
  void createUser(UserModel user) {
    if (!_emailValidation.isValidEmail(user.email)) return;

    _hashPassword.hashPassword(user.password);
    _userRepository.saveToDatabase(user);
    _emailService.sendWelcomeEmail(user.email);
    _userLogger.logUserCreation(user);
  }
}
