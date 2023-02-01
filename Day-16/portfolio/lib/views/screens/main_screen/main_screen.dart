import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';
import '../../constans/app_router.dart';

class MainScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     WorkService().create(work: );
      //   },
      //   child: Text("a"),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final image = await ImagePickerPlugin().pickImage(
      //       source: ImageSource.gallery,
      //       maxWidth: 200,
      //       maxHeight: 150,
      //       // accept: "image/png, image/jpeg",
      //     );
      //     ImageService().uploadFile(image);
      //   },
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(
              beamer: _beamerKey,
            ),
            if ((context.currentBeamLocation.state as BeamState)
                .uri
                .path
                .isEmpty)
              const Center(
                child: Text(
                  'No Data',
                  style: TextStyle(color: Colors.white, fontSize: 100),
                ),
              )
            else
              Expanded(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    locationBuilder: (routeInformation, beamParameters) {
                      return routeInformation.location!.contains('works')
                          ? WorkLocation(routeInformation)
                          : routeInformation.location!.contains('about-me')
                              ? AboutMeLocation(routeInformation)
                              : routeInformation.location!
                                      .contains('get-in-touch')
                                  ? GetInTouchLocation(routeInformation)
                                  : HomeLocation(routeInformation);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
