import 'package:bloc_manager/presentation/screens/page_second.dart';
import 'package:bloc_manager/presentation/screens/page_third.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/my_home_page.dart';

class AppRouter1 {
  final CounterCubit _counterCubit = CounterCubit();
  Route? OnGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const MyHomePage(),
          ),
        );
      case 'home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const MyHomePage(),
          ),
        );
      case 'second_page':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const PageSecond(),
          ),
        );
      case 'third_page':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const PageThird(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
