import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/email_validation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/hash_password.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_creation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_logger.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.1/good%20/user_repository.dart';

void main() {
  UserCreation userCreation = UserCreation(
    UserLogger(),
    UserRepository(),
    HashPassword(),
    EmailValidation(),
    EmailService(),
  );
  UserModel userModel = UserModel(
    email: 'test@gmail.com',
    password: '123456',
    name: 'test',
  );

  userCreation.createUser(userModel);
}
