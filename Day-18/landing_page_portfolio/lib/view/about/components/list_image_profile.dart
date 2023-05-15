import 'package:flutter/material.dart';

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
          return const Center(
            child: CircularProgressIndicator(),
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
                      return item25(context, image: data[index].source);

                    case "m":
                      return item50(context, image: data[index].source);

                    case "l":
                      return item75(context, image: data[index].source);

                    case "xl":
                      return item100(context, image: data[index].source);

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
