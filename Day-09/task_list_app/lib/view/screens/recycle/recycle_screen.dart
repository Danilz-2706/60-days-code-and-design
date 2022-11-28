import 'package:flutter/material.dart';
import 'package:task_list_app/view/components/side_menu.dart';
import 'package:task_list_app/view/constants/responsive.dart';

import 'components/body_recycle_screen.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            const Expanded(
              flex: 5,
              child: BodyRecycleScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
