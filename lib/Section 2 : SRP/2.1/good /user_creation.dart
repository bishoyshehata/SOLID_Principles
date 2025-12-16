import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_validation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/hash_password.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_logger.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_repository.dart';

class UserCreation {
  UserLogger userLogger;
  UserRepository userRepository;
  HashPassword hashPassword;
  EmailValidation emailValidation;
  EmailService emailService;

  UserCreation(
    this.userLogger,
    this.userRepository,
    this.hashPassword,
    this.emailValidation,
    this.emailService,
  );
  void createUser(UserModel user) {
    if (!emailValidation.isValidEmail(user.email)) return;

    hashPassword.hashPassword(user.password);
    userRepository.saveToDatabase(user);
    emailService.sendWelcomeEmail(user.email);
    userLogger.logUserCreation(user);
  }
}
