import 'package:flutter/material.dart';

import '../../components/footer.dart';
import '../../constans/grid_system.dart';

class ContainerWorkDetail extends StatelessWidget {
  const ContainerWorkDetail({
    super.key,
    required this.work,
  });
  final Map<String, dynamic> work;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: gridSystemMyApp(
        context,
        [
          item100(
            context,
            widget: Text(
              work['name'],
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
          item100(
            context,
            widget: const Footer(),
          ),
        ],
      ),
    );
  }
}
