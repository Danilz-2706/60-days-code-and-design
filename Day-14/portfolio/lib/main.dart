import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/controllers/blocs/work/work_bloc.dart';
import 'package:portfolio/controllers/services/firestore_service/image.dart';
import 'package:portfolio/controllers/services/firestore_service/process.dart';
import 'package:portfolio/controllers/services/firestore_service/profile.dart';
import 'package:portfolio/controllers/services/firestore_service/work.dart';
import 'package:portfolio/views/constans/app_router.dart';

import 'controllers/blocs/profile/profile_bloc.dart';
import 'firebase_options.dart';
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
      // ignore: todo
      //TODO: All Service
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
      ],
      child: MultiBlocProvider(
        providers: [
          // ignore: todo
          //TODO: Bloc Provider was created when build web - app

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
