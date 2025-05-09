import 'package:musium/features/auth/domain/repositories/auth_repo.dart';

class LogInUserUseCase {
  AuthRepo authRepo;

  LogInUserUseCase(this.authRepo);

  Future<void> call({required String email, required String password}) async {
    return await authRepo.logInUser(email: email, password: password);
  }
}
