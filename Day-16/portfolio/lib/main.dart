import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'controllers/blocs/bloc_exports.dart';
import 'controllers/services/service_exports.dart';
import 'firebase_options.dart';
import 'views/constans/app_router.dart';
import 'views/constans/colors.dart';

void main(List<String> args) async {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(),
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) => MainLocation(routeInformation),
  );

  MyApp({super.key});

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
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
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
