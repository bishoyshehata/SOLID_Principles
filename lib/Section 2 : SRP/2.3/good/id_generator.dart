class IdGenerator {
  // Job 1: Generate IDs
  String generateId() {
    return 'user_${DateTime.now().millisecondsSinceEpoch}';
  }
}
