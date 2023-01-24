import 'package:flutter/material.dart';

import '../../components/big_title.dart';
import '../../components/footer.dart';
import '../../constans/grid_system.dart';
import 'components/list_work.dart';

class ContainerWork extends StatelessWidget {
  const ContainerWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          gridSystemMyApp(
            context,
            [
              BigTitle(context: context, title: "All work"),
            ],
          ),
          const ListWork(),
          gridSystemMyApp(
            context,
            [
              item100(
                context,
                widget: const Footer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
