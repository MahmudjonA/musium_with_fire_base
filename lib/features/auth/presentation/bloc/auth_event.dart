abstract class AuthEvent {
  const AuthEvent();
}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;

  const RegisterUser({required this.email, required this.password});
}

class LogInUser extends AuthEvent {
  final String email;
  final String password;

  const LogInUser({required this.email, required this.password});
}
