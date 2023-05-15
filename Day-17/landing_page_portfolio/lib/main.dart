import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'controller/cubits/cubit_export.dart';
import 'firebase_options.dart';
import 'view/constans/app_router.dart';
import 'view/constans/colors.dart';
import 'view/constans/custom_scroll.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit()..getProfile(),
        ),
        BlocProvider<WorkCubit>(
          create: (context) => WorkCubit()..getAllWork(),
        ),
        BlocProvider<GetInTouchCubit>(
          create: (context) => GetInTouchCubit()..getAllGetInTouch(),
        ),
        BlocProvider<ImageCubit>(
          create: (context) => ImageCubit()..getListImage(),
        ),
      ],
      child: MaterialApp.router(
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'DMSans',
          scaffoldBackgroundColor: kBgDarkColor,
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
      ),
    );
  }
}
