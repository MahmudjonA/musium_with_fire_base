import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musium/features/auth/presentation/bloc/register/register_state.dart';

import '../../../domain/use_cases/register_user_use_case.dart';
import '../auth_event.dart';

class RegisterUserBloc extends Bloc<AuthEvent, RegisterUserState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterUserBloc(this.registerUserUseCase) : super(RegisterUserInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(RegisterUserLoading());
      try {
        await registerUserUseCase(email: event.email, password: event.password);
        emit(RegisterUserSuccess());
      } catch (e) {
        emit(RegisterUserError(message: e.toString()));
      }
    });
  }
}
