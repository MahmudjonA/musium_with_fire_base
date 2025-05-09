import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musium/features/auth/presentation/bloc/log_in/log_in_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/auth/presentation/bloc/register/register_bloc.dart';

class MyBlocProvider extends StatelessWidget {
  const MyBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //* Auth
        BlocProvider<RegisterUserBloc>(
          create: (context) => sl<RegisterUserBloc>(),
        ),
        BlocProvider<LoginUserBloc>(create: (context) => sl<LoginUserBloc>()),
      ],
      child: child,
    );
  }
}
