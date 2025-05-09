abstract class AuthRepo {
  Future<void> registerUser({required String email, required String password});

  Future<void> logInUser({required String email, required String password});
}
