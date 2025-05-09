import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musium/features/auth/domain/use_cases/log_in_user_use_case.dart';
import '../auth_event.dart';
import 'log_in_state.dart';

class LoginUserBloc extends Bloc<AuthEvent, LoginUserState> {
  final LogInUserUseCase loginUserUseCase;

  LoginUserBloc(this.loginUserUseCase) : super(LoginUserInitial()) {
    on<LogInUser>((event, emit) async {
      emit(LoginUserLoading());
      try {
        await loginUserUseCase(email: event.email, password: event.password);
        emit(LoginUserSuccess());
      } catch (e) {
        emit(LoginUserError(message: e.toString()));
      }
    });
  }
}
