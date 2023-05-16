import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../controller/cubits/cubit_export.dart';
import '../../constans/grid_system.dart';

class ListImageProfile extends StatelessWidget {
  const ListImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is ImageLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is ImageLoaded) {
          var data = state.listImage;
          return gridSystemMyApp(
            context,
            [
              ...List.generate(
                data.length,
                (index) {
                  switch (data[index].size) {
                    case "s":
                      return item25(context, false, image: data[index].source);

                    case "m":
                      return item50(context, false, image: data[index].source);

                    case "l":
                      return item75(context, false, image: data[index].source);

                    case "xl":
                      return item100(context, false, image: data[index].source);

                    default:
                      return Container();
                  }
                },
              ),
            ],
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
