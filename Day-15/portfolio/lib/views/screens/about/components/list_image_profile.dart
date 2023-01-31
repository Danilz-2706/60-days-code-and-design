import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/views/constans/grid_system.dart';

import '../../../../controllers/blocs/image/image_bloc.dart';
import '../../../../controllers/services/firestore_service/image.dart';

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
          if (state is LoadedImageState) {
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
                    if (data[index].size == "s") {
                      return item25(context, image: data[index].source);
                    }
                    if (data[index].size == "m") {
                      return item50(context, image: data[index].source);
                    }
                    if (data[index].size == "l") {
                      return item75(context, image: data[index].source);
                    }
                    if (data[index].size == "xl") {
                      return item100(context, image: data[index].source);
                    }
                    return Container();
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
