import 'package:flutter/material.dart';

import '../../../components/textfield_search.dart';
import '../../../components/title_default.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TitleDefault(
              title: "Danilz Restourant", time: "30 September 2022"),
        ),
        Expanded(
          flex: 3,
          child: TextFieldSearch(hintext: "Search menu here ..."),
        )
      ],
    );
  }
}
