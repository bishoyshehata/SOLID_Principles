import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/id_generator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/notifications.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/repository.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/search.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_creations.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_logger.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_validation.dart';

void main() {
  UserCreations manager = UserCreations(
    IdGenerator(),
    UserValidation(),
    UserRepository(),
    UserNotification(),
    UserLogger(),
    Search(),
  );
  try {
    final user = manager.createUser('Alice', 'Smith', 'alice@example.com', [
      'user',
    ]);
    print('✅ Created user: ${user.firstName} ${user.lastName}');
  } catch (e) {
    print('Error: $e');
  }
}
