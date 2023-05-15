import 'package:flutter/material.dart';

import '../components/footer.dart';
import '../constans/grid_system.dart';
import 'components/process_detail.dart';
import 'components/title_work_detail.dart';

class ContainerWorkDetail extends StatelessWidget {
  const ContainerWorkDetail({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleWorkDetail(workId: workId),
          ProcessDetail(workId: workId),
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
