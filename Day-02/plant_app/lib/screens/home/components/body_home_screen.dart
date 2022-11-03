import 'package:flutter/material.dart';
import 'header_with_search_box.dart';
import 'list_featured_plants.dart';
import 'list_recomended_plants.dart';
import 'title_with_more_button.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderWithSearchBox(),
          TitleWithMoreButton(
            text1: "Recomended",
            text2: "More",
          ),
          ListRecomendedPlants(),
          TitleWithMoreButton(
            text1: "Featured Plants",
            text2: "More",
          ),
          ListFeaturedPlants(),
        ],
      ),
    );
  }
}
