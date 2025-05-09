import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:musium/features/auth/presentation/bloc/log_in/log_in_bloc.dart';

import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import '../../features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/domain/use_cases/log_in_user_use_case.dart';
import '../../features/auth/domain/use_cases/register_user_use_case.dart';
import '../../features/auth/presentation/bloc/register/register_bloc.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  //! Firebase
  final firebaseAuth = FirebaseAuth.instance;

  //! Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(auth: firebaseAuth),
  );

  //! Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  //! Use cases
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => LogInUserUseCase(sl()));

  //! Bloc
  sl.registerLazySingleton(() => RegisterUserBloc(sl()));
  sl.registerLazySingleton(() => LoginUserBloc(sl()));
}
