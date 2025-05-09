import '../../domain/repositories/auth_repo.dart';
import '../data_sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<void> registerUser({required String email, required String password}) {
    return authRemoteDataSource.registerUser(email: email, password: password);
  }

  @override
  Future<void> logInUser({required String email, required String password}) {
    return authRemoteDataSource.logInUser(email: email, password: password);
  }
}
