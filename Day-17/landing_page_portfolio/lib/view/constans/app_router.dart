import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:landing_page_portfolio/view/home/navigator/navigator_screen.dart';
import 'package:landing_page_portfolio/view/landing_page/landing_page_screen.dart';

import '../about/container_about.dart';
import '../get_in_touch/container_getintouch.dart';
import '../home/container_home.dart';
import '../main_screen/main_screen.dart';
import '../work/container_work.dart';
import '../work_detail/container_work_detail.dart';

//Location for Beamer
// -------------------------------------
class NavigaLocation extends BeamLocation<BeamState> {
  NavigaLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('navigabeamer'),
          title: 'My Portfolio',
          child: NavigaBeamer(),
        )
      ];
}

//Main Location
class LandingPageLocation extends BeamLocation<BeamState> {
  LandingPageLocation(RouteInformation routeInformation)
      : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/tandat'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('landingpage'),
          title: 'My Portfolio',
          child: LandingPage(),
        )
      ];
}

//Main Location
class MainLocation extends BeamLocation<BeamState> {
  MainLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/portfolio'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('portfolio'),
          title: 'My Portfolio',
          child: MainScreen(),
        )
      ];
}

//Home Location
class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/portfolio/home'];

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
  List<String> get pathPatterns =>
      ['/portfolio/works', '/portfolio/works/:workId'];

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
      beamPages.add(
        BeamPage(
            key: ValueKey('work-$workId'),
            title: "pageTitle",
            child: ContainerWorkDetail(workId: workId!)),
      );
    }
    return beamPages;
  }
}

//About Me Location
class AboutMeLocation extends BeamLocation<BeamState> {
  AboutMeLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => ['/portfolio/about-me'];

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
  List<String> get pathPatterns => ['/portfolio/get-in-touch'];

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

