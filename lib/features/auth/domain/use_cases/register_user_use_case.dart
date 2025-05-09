import 'package:musium/features/auth/domain/repositories/auth_repo.dart';

class RegisterUserUseCase {
  AuthRepo authRepo;

  RegisterUserUseCase(this.authRepo);

  Future<void> call({required String email, required String password}) async {
    return await authRepo.registerUser(email: email, password: password);
  }
}
