abstract class LoginUserState {
  const LoginUserState();
}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  const LoginUserSuccess();
}

class LoginUserError extends LoginUserState {
  final String message;

  const LoginUserError({required this.message});
}
