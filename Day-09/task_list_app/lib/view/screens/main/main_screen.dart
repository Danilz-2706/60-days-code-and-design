import 'package:flutter/material.dart';

import '../../../controller/blocs/bloc_exports.dart';
import 'components/side_menu.dart';
import '../../constants/responsive.dart';
import '../recycle/recycle_screen.dart';
import '../task/task_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<NavigatorMenuBloc>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: BlocBuilder<NavigatorMenuBloc, NavigatorMenuState>(
                builder: (context, state) {
                  // ignore: avoid_print
                  print(state.indexMenu);
                  if (state.indexMenu == 0) {
                    return const TaskScreen();
                  }
                  if (state.indexMenu == 1) {
                    return const RecycleScreen();
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
