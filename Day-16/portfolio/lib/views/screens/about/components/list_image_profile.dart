import 'package:flutter/material.dart';
import 'package:portfolio/views/constans/grid_system.dart';

import '../../../../controllers/blocs/bloc_exports.dart';
import '../../../../controllers/services/service_exports.dart';

class ListImageProfile extends StatelessWidget {
  const ListImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageBloc>(
      create: (context) => ImageBloc(
          imageService: RepositoryProvider.of<ImageService>(context))
        ..add(
            const GetListImageEvent(folderName: "main-user", size: ['m', 's'])),
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is LoadingImageState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetListImageState) {
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
      ),
    );
  }
}
