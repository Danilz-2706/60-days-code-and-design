import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'controller/blocs/bloc_exports.dart';
import 'controller/services/service_exports.dart';
import 'firebase_options.dart';
import 'view/constans/app_router.dart';
import 'view/constans/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) => NavigaLocation(routeInformation),
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProfileService>(
          create: (context) => ProfileService(),
        ),
        RepositoryProvider<WorkService>(
          create: (context) => WorkService(),
        ),
        RepositoryProvider<ProcessService>(
          create: (context) => ProcessService(),
        ),
        RepositoryProvider<ImageService>(
          create: (context) => ImageService(),
        ),
        RepositoryProvider<GetInTouchService>(
          create: (context) => GetInTouchService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
                profileService: RepositoryProvider.of<ProfileService>(context))
              ..add(const GetEvent()),
          ),
          BlocProvider<WorkBloc>(
            create: (context) => WorkBloc(
                workService: RepositoryProvider.of<WorkService>(context))
              ..add(GetAllWorkEvent()),
          ),
          BlocProvider<GetInTouchBloc>(
            create: (context) => GetInTouchBloc(
                getInTouchService:
                    RepositoryProvider.of<GetInTouchService>(context))
              ..add(GetAllGetInTouchEvent()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'DMSans',
            scaffoldBackgroundColor: kBgDarkColor,
          ),
          routeInformationParser: BeamerParser(),
          routerDelegate: routerDelegate,
        ),
      ),
    );
  }
}
