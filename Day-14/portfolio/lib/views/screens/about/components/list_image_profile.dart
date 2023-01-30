import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/image/image_bloc.dart';
import '../../../../controllers/services/firestore_service/image.dart';

class ListImageProfile extends StatelessWidget {
  const ListImageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageBloc>(
      create: (context) =>
          ImageBloc(imageService: RepositoryProvider.of<ImageService>(context))
            ..add(const GetListImageEvent(folderName: "main-user")),
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is LoadedImageState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetListImageState) {
            var data = state.listImage;

            return Row(
              children: List.generate(data.length,

                  // ignore: todo
                  //TODO: image for my profile
                  (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(
                      data[index],
                      // fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
