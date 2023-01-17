import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../screens/about/container_about.dart';
import '../screens/get_in_touch/container_getintouch.dart';
import '../screens/home/container_home.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/work/container_work.dart';
import '../screens/work_detail/container_work_detail.dart';

//Location for Beamer
// -------------------------------------
const List<Map<String, dynamic>> works = [
  {
    'workId': '1',
    'name': 'Stranger in a Strange Land',
  },
  {
    'workId': '1',
    'name': 'Stranger in a Strange Land',
  },
  {
    'workId': '1',
    'name': 'Stranger in a Strange Land',
  },
];

//Main Location
class MainLocation extends BeamLocation<BeamState> {
  MainLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('portfolio'),
          title: 'My Portfolio',
          child: MainScreen(),
        )
      ];
}

//Home Location
class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: ContainerHome(),
        )
      ];
}

//Work Location
class WorkLocation extends BeamLocation<BeamState> {
  WorkLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/works', '/works/:workId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> beamPages = [];
    if (state.pathPatternSegments.contains('works')) {
      beamPages.add(
        const BeamPage(
          key: ValueKey('works'),
          title: 'All Work',
          child: ContainerWork(),
        ),
      );
    }
    if (state.pathParameters.containsKey('workId')) {
      final workId = state.pathParameters['workId'];
      final work = works.firstWhere((work) => work['workId'] == workId);
      final pageTitle = work['name'];

      beamPages.add(
        BeamPage(
          key: ValueKey('work-$workId'),
          title: pageTitle,
          child: ContainerWorkDetail(
            work: work,
          ),
        ),
      );
    }
    return beamPages;
  }
}

//About Me Location
class AboutMeLocation extends BeamLocation<BeamState> {
  AboutMeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/about-me'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('about-me'),
          title: 'About Me',
          child: ContainerAbout(),
        ),
      ];
}

//Get in touch Location
class GetInTouchLocation extends BeamLocation<BeamState> {
  GetInTouchLocation(RouteInformation routeInformation)
      : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/get-in-touch'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('get-in-touch'),
          title: 'Get in touch',
          child: ContainerGetInTouch(),
        ),
      ];
}



// -------------------------------------

